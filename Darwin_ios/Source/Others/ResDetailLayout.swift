// レストラン詳細画面レイアウトクラス

import UIKit

class ResDetailLayout: UICollectionViewFlowLayout {
    
    private var contentSize = CGSizeZero
    private var sectionCells = [CGRect]()
    
    /**
     初期化処理
     スクロール方向をhorizontalに設定
     
     - parameter aDecoder: <#aDecoder description#>
     
     - returns: <#return value description#>
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
    
    /**
     レイアウト前処理
     collectionviewに設定されているitem数に応じて、画面幅セルのrectを計算
     collectionview.contentSizeも計算する
     */
    override func prepareLayout() {
        super.prepareLayout()
        guard let cv = self.collectionView else {
            return
        }
        // 配置するセルサイズ
        let cellSize = CGSizeMake(cv.bounds.width, cv.bounds.height)
        
        // item数分のセルrectを配列に格納しておく
        // 詳細画面に配置するcollectionViewはsectionが1つしかないため、indexは0指定でよい
        for item in 0..<cv.numberOfItemsInSection(0) {
            let cellRect = CGRectMake(cellSize.width*CGFloat(item), 0.0, cellSize.width, cellSize.height)
            sectionCells.append(cellRect)
        }
        
        // collectionViewのcontentSizeとして設定する値を計算
        contentSize = CGSizeMake(cellSize.width * CGFloat(cv.numberOfItemsInSection(0)), cellSize.height)
    }
    
    /**
     contentSizeとして、prepareで計算した値を返す
     
     - returns: <#return value description#>
     */
    override func collectionViewContentSize() -> CGSize {
        return contentSize
    }
    
    /**
     画面表示領域内のレイアウト属性を返す処理
     
     - parameter rect: <#rect description#>
     
     - returns: <#return value description#>
     */
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let cv = self.collectionView else {
            return nil
        }
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // 詳細画面に配置するcollectionViewはsectionが1つしかないため、indexは0指定
        for item in 0..<cv.numberOfItemsInSection(0) {
            let targetIndex = NSIndexPath(forItem: item, inSection: 0)
            let attribute = layoutAttributesForItemAtIndexPath(targetIndex)! as UICollectionViewLayoutAttributes
            // 取得したセルframeが表示領域内に入っていれば、配列に格納する
            if (CGRectIntersectsRect(rect, attribute.frame)){
                layoutAttributes.append(attribute)
            }
        }
        return layoutAttributes
    }
    
    /**
     indexPathごとのレイアウト属性を返す処理
     layoutAttributesForElementsInRectから呼ばれる処理
     
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = super.layoutAttributesForItemAtIndexPath(indexPath)?.copy() as! UICollectionViewLayoutAttributes
        attribute.frame = sectionCells[indexPath.item]
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
