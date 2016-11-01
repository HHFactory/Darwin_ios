
/**
 レストラン詳細画面用VC
 
 */

import UIKit

class RestaurantDetailPage: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    internal var testData: String?
    
    /**
     初期化処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = testData
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
