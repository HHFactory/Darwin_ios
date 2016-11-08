
/**
 ホームタブ下部コンテンツ表示エリア用CollectionViewのDataSource
 コンテンツエリアに表示するセルの設定やセル数の設定をする
 */

import UIKit

class HomeContentDataSource: NSObject, UICollectionViewDataSource {
    
    /**
     初期化処理
     初期化するたびに選択されていたindexを0に設定する
     
     - returns: <#return value description#>
     */
    override init() {
        super.init()
    }
    
    
    /**
     セクション数の設定
     
     - parameter collectionView: <#collectionView description#>
     
     - returns: <#return value description#>
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    /**
     セクション内に表示するセル数の設定
     
     - parameter collectionView: <#collectionView description#>
     - parameter section:        <#section description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 //test
    }
    
    
    /**
     表示するセルの設定
     
     - parameter collectionView: <#collectionView description#>
     - parameter indexPath:      <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ViewIdentifiers.HomeContentViewCell.rawValue,  forIndexPath: indexPath) as! HomeContentCell
        cell.menuNameLabel.text = "\(indexPath.section)-\(indexPath.item)"
        return cell
    }
    
    
    
}
