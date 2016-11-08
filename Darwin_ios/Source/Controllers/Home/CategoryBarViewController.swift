
/**
 ホームタブ画面上部のカテゴリ表示用VC
 CollectionViewを使い、横スクロールでカテゴリを表示させる。
 無限スクロールに対応
 */

import UIKit
import Foundation

class CategoryBarViewController: UIViewController {
    
    @IBOutlet var categoryBarView: UICollectionView!
    var categorySelectedDelegate: CategorySelectedDelegate?

    var contentOffsetX: CGFloat       = 0.0
    private let categoryBarDataSource = CategoryBarDataSource()
    var didLayoutFlag: Bool           = false
    var currentCategoryItem           = 0

    
    /**
     初期化処理
     delegate,datasourceの設定
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryBarView.dataSource = categoryBarDataSource
        categoryBarView.delegate = self
    }
    
    
    /**
     レイアウト処理終了時点に呼ばれる
     初期表示時に選択済みカテゴリを画面中央に配置する
     index:0だと画面中央に表示されないので、要素群でindex0と同等のindexを指定する
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if !didLayoutFlag {
            focusCell(NSIndexPath(forItem: CategoryIndex.categoryCount, inSection: 0), animated: false)
            didLayoutFlag = true
        }
    }
    
    /**
     指定されたindexのセルにフォーカスする
     
     - parameter beforeFocusedIndexPath: 前回フォーカスされていたindex
     - parameter focusTargetindexPath: 今回フォーカスするindex
     - parameter animated:        スクロールする際にアニメーションを設定するか
     */
    func focusCell(focusTargetIndexPath: NSIndexPath, animated: Bool) {
        //TODO' controllerのフィールドで管理？
        CategoryIndex.currentItem = focusTargetIndexPath.item

        // 現在セルindex値を更新する
        currentCategoryItem = focusTargetIndexPath.item
        
        // 一旦cellを全てunfocusする
        unfocusedAllCell()

        if let nextCell = categoryBarView.cellForItemAtIndexPath(focusTargetIndexPath) as? CategoryBarCell {
            nextCell.isCurrent = true
        }

        // 今回選択したセルを画面中央にスクロールさせる
        categoryBarView.scrollToItemAtIndexPath(focusTargetIndexPath, atScrollPosition: .CenteredHorizontally, animated: animated)
        contentOffsetX = categoryBarView.contentOffset.x
        categoryBarView.layoutIfNeeded()
    }
    
    /**
     表示されているセルを全てunfocusする
     */
    func unfocusedAllCell() {
        categoryBarView
            .visibleCells()
            .flatMap{ $0 as? CategoryBarCell}
            .forEach{ $0.setFocusColor(false); $0.isCurrent = false }
    }
    
    
    /**
     カテゴリーバーを次のカテゴリセルまでスクロールさせる
     ページスクロールと同期させるための処理
     現在セルは画面中央に位置しているものを取得する
     
     - parameter targetIndex:   <#targetIndex description#>
     - parameter contentOffset: <#contentOffset description#>
     */
    func scrollOffset(scrollRate: CGFloat, direction: UIPageViewControllerNavigationDirection) {
        guard categoryBarView.userInteractionEnabled else {
            return
        }
        
        // 現在セルindexを取得する
        var currentItem = 0
        do {
            try currentItem = getCurrentIndex()
        } catch {
            currentItem = currentCategoryItem
        }
        
        let currentIndexPath = NSIndexPath(forItem: currentItem, inSection: 0)
        let nextItem = direction == .Forward ? currentItem+1 : currentItem-1
        
        
        let nextIndexPath = NSIndexPath(forItem: nextItem, inSection: 0)
        
        if let currentCell = categoryBarView.cellForItemAtIndexPath(currentIndexPath) as? CategoryBarCell,
            let nextCell = categoryBarView.cellForItemAtIndexPath(nextIndexPath) as? CategoryBarCell {

            // 移動距離は現在セルの中心から、次セルの中心まで
            let distance = currentCell.frame.width/2 + nextCell.frame.width/2
            
            // 次のセルまでスクロールし始めたら、フォーカスを変える
            if fabs(scrollRate) > 0.6 {
                currentCell.setFocusColor(false)
                nextCell.setFocusColor(true)
            } else {
                currentCell.setFocusColor(true)
                nextCell.setFocusColor(false)
            }

            // 現在セルの中心からスクロール量分だけ動かす
            categoryBarView.contentOffset.x = contentOffsetX + scrollRate*distance
        }
    }
    
    /**
     表示されているセルの中で現在セルのindexを返す
     現在セルが表示されていなかったらエラーをスローする
     
     - throws: 現在セルが表示されていなかったら
     
     - returns: 現在セルのindex
     */
    func getCurrentIndex() throws -> Int {
        let currentCells = categoryBarView
            .visibleCells()
            .flatMap{ $0 as? CategoryBarCell }
            .filter{ $0.isCurrent }
        
        if currentCells.count > 0 {
            // 現在セルは１つだけのため、配列から0indexで取得してよい
            return currentCells[0].cellIndex!
        } else{
            // TODO:エラーコードはenum管理に変更する
            throw NSError(domain: "not visible current cell", code: 1, userInfo: nil)
        }
    }
    
}


extension CategoryBarViewController: UICollectionViewDelegate {

    /**
     カテゴリバースクロール時の挙動
     セル数 = 表示するデータ数×3としているため、コンテンツサイズ/3 ＝　基準サイズとする
     contentoffset.x（右端）が、2倍を超えたら真ん中に戻す処理
     
     - parameter scrollView: <#scrollView description#>
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let categoryBarWidth = floor(scrollView.contentSize.width / 3)
        if (scrollView.contentOffset.x <= 0) || (scrollView.contentOffset.x > categoryBarWidth * 2.0) {
            scrollView.contentOffset.x = categoryBarWidth
        }
    }
    
    /**
     セル選択時の処理
     
     - parameter collectionView: <#collectionView description#>
     - parameter indexPath:      <#indexPath description#>
     */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        focusCell(indexPath, animated: true)
        
        // スクロール方向を設定するための数値
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CategoryBarCell
        let selectedCellX = cell.center.x-collectionView.contentOffset.x
        let screenCenterX = collectionView.center.x
        
        var scrollDirection: UIPageViewControllerNavigationDirection = .Forward
        // 選択したセル位置が画面中央より左にある場合にreverseする
        if (selectedCellX < screenCenterX) {
            scrollDirection = .Reverse
        }
        
        // 適切なページを表示するメソッドを呼び出す
        categorySelectedDelegate?.focusTargetPage(targetPageItem: indexPath.item % CategoryIndex.categoryCount, scrollDirection: scrollDirection)
    }
    
}

extension CategoryBarViewController: UICollectionViewDelegateFlowLayout {
    
    /**
     indexごとのセルサイズを設定する
     ラベルに表示するテキスト幅を考慮し、文字長さに応じたセル幅を設定する
     
     - parameter collectionView:       <#collectionView description#>
     - parameter collectionViewLayout: <#collectionViewLayout description#>
     - parameter indexPath:            <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let labelText:NSString = TestData.sharedInstance.data[indexPath.item%CategoryIndex.categoryCount].menuTitle
        let font = UIFont.systemFontOfSize(17.0)
        let size: CGSize = labelText.sizeWithAttributes([NSFontAttributeName: font])
        return CGSize(width: size.width+20, height: collectionView.bounds.height)
    }
    
    /**
     セルとラインの最小スペースを設定
     
     - parameter collectionView:       <#collectionView description#>
     - parameter collectionViewLayout: <#collectionViewLayout description#>
     - parameter section:              <#section description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    /**
     セル同士の最小スペースを設定
     
     - parameter collectionView:       <#collectionView description#>
     - parameter collectionViewLayout: <#collectionViewLayout description#>
     - parameter section:              <#section description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
}
