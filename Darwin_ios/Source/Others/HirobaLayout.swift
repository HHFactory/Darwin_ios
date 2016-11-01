
/**
 ひろばCollectionViewカスタムレイアウトクラス
 画面幅/3をセル1辺の基準サイズとし、小セルと大セルの2種類を組み合わせる
 */

import UIKit

class HirobaLayout: UICollectionViewFlowLayout {
    
    private var contentSize  = CGSizeZero
    private var sectionCells = [[CGRect]]()
    
    /**
     初期化処理
     
     - parameter aDecoder: <#aDecoder description#>
     
     - returns: <#return value description#>
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    /**
     レイアウト前処理
     表示するセルのレイアウト位置を計算する
     collectionViewのcontentSizeも当メソッドで計算する
     
     */
    override func prepareLayout() {
        super.prepareLayout()
        guard let collectionView = self.collectionView else{
            return
        }
        
        // cellpattern struct initialize
        let cellPattern = CellPattern(basisCellSize: collectionView.bounds.width/3)
  
        // heightは表示するセル数やサイズによって変化するため、高さ以外のcontentSizeを設定する。
        contentSize = CGSize(width: collectionView.bounds.width, height: 0)
        
        var cellRect:CGRect = CGRectZero
        
        // 設定されているsectionごとにcellの配置位置を決める
        for section in 0..<collectionView.numberOfSections() {
            var cells = [CGRect]()
            var height = contentSize.height
            let itemCountInSection: Int = collectionView.numberOfItemsInSection(section)

            // 奇数sectionのセル位置設定
            if (section % 2 == 0){
                for item in 0..<collectionView.numberOfItemsInSection(section) {
                    let targetIndex = NSIndexPath(forItem: item, inSection: section)
                    cellRect = cellPattern.makeCellRectAtOddSection(itemCountInSection, indexPath: targetIndex)
                    cells.append(cellRect)
                }
            }
            // 偶数sectionのセル位置設定
            else {
                for item in 0..<collectionView.numberOfItemsInSection(section) {
                    let targetIndex = NSIndexPath(forItem: item, inSection: section)
                    cellRect = cellPattern.makeCellRectAtEvenSection(itemCountInSection, indexPath: targetIndex)
                    cells.append(cellRect)
                }
            }
            
            // contentSizeのheight値を更新
            if (height < cellRect.origin.y + cellRect.height) {
                height = cellRect.origin.y + cellRect.height
            }

            sectionCells.append(cells)
            contentSize = CGSize(width: collectionView.bounds.width, height: height)
        }
    }
    
    /**
     collectionViewのcontentSizeを返す
     contentSize = スクロール分も含めた画面サイズと考えれば良い
     
     prepareLayoutで計算した結果を返す
     ただしく設定しないと、画面がスクロールしない
     
     - returns: <#return value description#>
     */
    override func collectionViewContentSize() -> CGSize {
        return contentSize
    }
    
    /**
     画面表示されるCGRect内のレイアウト属性を設定する
     prepareLayou処理のあとによびだされる
     
     collectionViewに設定しているsection,itemごとのレイアウト情報を取得し
     各indexPathごとのframeをlayoutAttributesForItemAtIndexPathにて設定。
     表示されているCGRect内に収まるレイアウト情報を、配列で返す
     
     - parameter rect: <#rect description#>
     
     - returns: <#return value description#>
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        guard let collectionView = self.collectionView else {
            return nil
        }

        for section in 0..<collectionView.numberOfSections() {
            for item in 0..<collectionView.numberOfItemsInSection(section) {
                let targetIndex = NSIndexPath(forItem: item, inSection: section)
                let attribute = layoutAttributesForItemAtIndexPath(targetIndex)! as UICollectionViewLayoutAttributes
                if (CGRectIntersectsRect(rect, attribute.frame)){
                    layoutAttributes.append(attribute)
                }
            }
        }
        
        return layoutAttributes
    }
    
    /**
     IndexPathのレイアウト属性を設定する
     prepareLayoutで設定したindexPathごとのセルサイズに変更し返す
     
     superクラスから取得したattributeをcopyしないとキャッシュしているレイアウト情報とミスマッチがおこり、waringが出力される
     詳細は要調査
     
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = super.layoutAttributesForItemAtIndexPath(indexPath)?.copy() as! UICollectionViewLayoutAttributes
        attribute.frame = sectionCells[indexPath.section][indexPath.item]
        return attribute
    }
    
    /**
     画面スクロール時にレイアウト計算を行うか設定する
     画面描画範囲外にもセルが表示されるため、trueにする
     
     - parameter newBounds: <#newBounds description#>
     
     - returns: <#return value description#>
     */
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

}
