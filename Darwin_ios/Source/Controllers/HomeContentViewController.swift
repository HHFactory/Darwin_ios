
/**
 ホームタブ画面下部のコンテンツ表示用VC
 collectionViewを使い、マルチカラム表示でメニュー情報を表示させる
 collectionViewのdelegateを担当、datasourceは他クラスに分離する
 
 */

import UIKit

class HomeContentViewController: UIViewController {
    
    @IBOutlet var contentCollectionView: UICollectionView!
    private let contentDataSource = HomeContentDataSource()
    internal var pageIndex: Int = 0
    
    /**
     初期化処理
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = contentDataSource
        
        // xibファイルで作成したカスタムセルをcollectionViewに登録する
        let nib = UINib(nibName: NibNames.HomeContentCellNib.rawValue, bundle: nil)
        contentCollectionView.registerNib(nib, forCellWithReuseIdentifier: ViewIdentifiers.HomeContentViewCell.rawValue)
    }
    
    /**
     画面遷移時前処理
     segueを通して画面遷移する際にパラメータを渡す
     
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


extension HomeContentViewController: UICollectionViewDelegate {
 
    /**
     セル選択時処理
     
     - parameter collectionView: <#collectionView description#>
     - parameter indexPath:      <#indexPath description#>
     */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(SegueNames.ToRestaurantDetail.rawValue, sender: indexPath)
    }

}


extension HomeContentViewController: UICollectionViewDelegateFlowLayout {
    
    /**
     index位置に応じてセルサイズを設定する
     
     - parameter collectionView:       <#collectionView description#>
     - parameter collectionViewLayout: <#collectionViewLayout description#>
     - parameter indexPath:            <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        // 画面最上部と4行目のセルサイズはW:view幅、H:180に設定
        if (indexPath.row == 0 || indexPath.row == 3) {
            return CGSize(width: collectionView.bounds.width, height: 180.0)
        }
        // それ以外のセルサイズはW:view幅/2, H:180に設定
        else {
            return CGSize(width: collectionView.bounds.width / 2, height: 180.0)
        }
    }
    
    
    /**
     セル同士の最小横スペースを設定する
     横並びで2カラム表示したいので、最小を0.0に設定（セルサイズを画面幅/2にしているため）
     
     - parameter collectionView:       <#collectionView description#>
     - parameter collectionViewLayout: <#collectionViewLayout description#>
     - parameter section:              <#section description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    /**
     セル同士の最小縦スペースを設定する
     
     - parameter collectionView:       <#collectionView description#>
     - parameter collectionViewLayout: <#collectionViewLayout description#>
     - parameter section:              <#section description#>
     
     - returns: <#return value description#>
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
}
