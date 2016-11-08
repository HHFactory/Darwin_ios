
/**
 レストラン詳細画面用VC
 
 */

import UIKit

class RestaurantDetailContainerViewController: UIViewController {
    
    private var detailTabViewController: RestaurantDetailCategoryBarViewController?
    private var detailPageViewController: RestaurantDetailPageViewController?
    
    /**
     初期化処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.hidesBackButton = true
    }
    
    /**
     ステータスバーを非表示にする
     
     - returns: <#return value description#>
     */
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    /**
     StoryBoard上のContainerViewと各VCを紐付ける
     
     - parameter segue:  <#segue description#>
     - parameter sender: <#sender description#>
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? RestaurantDetailCategoryBarViewController where segue.identifier == SegueNames.EmbedDetailTabSegue.rawValue {
            detailTabViewController = vc
        }
        
        else if let vc = segue.destinationViewController as? RestaurantDetailPageViewController where segue.identifier == SegueNames.EmbedDetailPageSegue.rawValue {
            detailPageViewController = vc
        }
    }

}
