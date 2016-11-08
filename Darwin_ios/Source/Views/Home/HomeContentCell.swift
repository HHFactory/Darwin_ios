
/**
 ホーム画面コンテンツ部に表示するセルクラス
 
 */

import UIKit

class HomeContentCell: UICollectionViewCell {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    
    /**
     xibからの初期化処理
     
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
