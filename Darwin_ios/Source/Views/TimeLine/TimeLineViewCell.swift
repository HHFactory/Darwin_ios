
/**
 タイムラインタブ用のTableViewCellクラス
 */

import UIKit

class TimeLineViewCell: UITableViewCell {
    
    @IBOutlet weak var useIconImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postedImageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
    /**
     xibからの初期化処理
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}
