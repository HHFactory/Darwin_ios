
/**
 ひろばタブ用VC
 */

import UIKit

class HirobaViewController: UIViewController {
    
    @IBOutlet var hirobaCollectionView: UICollectionView!
    private let hirobaDataSource = HirobaDataSrouce()
    
    
    /**
     初期化処理
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        hirobaCollectionView.dataSource = hirobaDataSource
        hirobaCollectionView.delegate = self
        
        // imageCell.xibを再利用対象セルとして登録
        let nib = UINib(nibName: NibNames.HirobaImageCell.rawValue, bundle: nil)
        hirobaCollectionView.registerNib(nib, forCellWithReuseIdentifier: ViewIdentifiers.HirobaImageCell.rawValue)
    }
    
    /**
     segueでの画面遷移時前処理
     遷移先のVCを取得し、パラメータを渡す
     
     - parameter segue:  <#segue description#>
     - parameter sender: <#sender description#>
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueNames.ToRestaurantDetail.rawValue {
            let vc = segue.destinationViewController as! RestaurantDetailPage
            let selectedIndexPath = sender as! NSIndexPath
            vc.testData = selectedIndexPath.item.description
        }
    }

}


extension HirobaViewController: UICollectionViewDelegate {

    /**
     セル選択時処理
     セルタップ時に対象店舗の詳細画面に遷移する
     遷移はsegueにて行い、当処理ではsegueの指定とパラメータの設定を行う
     
     - parameter collectionView: <#collectionView description#>
     - parameter indexPath:      <#indexPath description#>
     */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(SegueNames.ToRestaurantDetail.rawValue, sender: indexPath)
    }
    
}
