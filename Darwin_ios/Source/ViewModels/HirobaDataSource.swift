
/**
 ひろばCollectionView用DataSourceクラス
 */

import UIKit

class HirobaDataSrouce: NSObject, UICollectionViewDataSource{

    /**
     セクション数の設定
     大セル1,小セル5のかたまりで1セクションとする
     初期表示させる最大画像数/6がセクション数となる？
     
     - parameter collectionView: <#collectionView description#>
     
     - returns: <#return value description#>
     */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 6 //test
    }

    
    /**
     セクション内のアイテム数
     大セル1,小セル5 = 6セル表示させる
     
     - parameter collectionView: <#collectionView description#>
     - parameter section:        <#section description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    /**
     表示するセルの設定
     HirobaImageCellクラスを返す
     
     - parameter collectionView: <#collectionView description#>
     - parameter indexPath:      <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ViewIdentifiers.HirobaImageCell.rawValue, forIndexPath: indexPath) as! HirobaImageCell
        cell.imageView.backgroundColor = UIColor.orangeColor()
        cell.label.text = "\(indexPath.section)-\(indexPath.item)"
        return cell
    }
    
}
