
/**
 ホームタブ画面上部のカテゴリ表示用CollectionViewのDataSource
 CategoryBarViewに表示させるセルの設定やアイテム数を設定するクラス
 */

import Foundation
import UIKit

class CategoryBarDataSource: NSObject, UICollectionViewDataSource {
    
    var currentItem = 0
    
    /**
     初期化処理
     
     - returns: <#return value description#>
     */
    override init() {
        super.init()
        CategoryIndex.categoryCount = TestData.sharedInstance.data.count
    }
    
    
    /**
     セクション数の設定
     セクション数1の場合は定義不要メソッドだが、わかりやすいように定義
     
     - parameter collectionView: <#collectionView description#>
     
     - returns: <#return value description#>
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    /**
     セクション内に表示させるセル数を設定する
     無限スクロールさせることを考慮して、取得したカテゴリ数*3を表示アイテム数に設定する
     
     - parameter collectionView: <#collectionView description#>
     - parameter section:        <#section description#>
     
     - returns: 表示するセルの数
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TestData.sharedInstance.data.count * 3
    }
    
    
    /**
     表示するセルの設定をする
     
     - parameter collectionView: <#collectionView description#>
     - parameter indexPath:      <#indexPath description#>
     
     - returns: 表示するセル
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let targetIndex = NSIndexPath(forItem: indexPath.item % CategoryIndex.categoryCount, inSection: 0)

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ViewIdentifiers.CategoryBarCell.rawValue, forIndexPath: indexPath) as! CategoryBarCell
        let targetCategory = TestData.sharedInstance.data[targetIndex.item]
        cell.cellIndex = indexPath.item
        
        // 現在選択されているセルおよび、選択されているセルグループindexと、同じグループindexを持つセルの場合はactiveにする。それ以外はfalse
        let active = (targetIndex.item == CategoryIndex.currentItem % CategoryIndex.categoryCount)
        cell.configCell(targetCategory.menuTitle, isFocus: active)
        return cell
    }
}