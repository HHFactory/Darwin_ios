
/**
 タイムライン詳細画面VC
 
 */

import UIKit

class TimeLineDetailViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var detailTableView: UITableView!
    private let dataSource = TimeLineDetailDataSource()
    
    /**
     初期化処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.delegate = self
        detailTableView.dataSource = dataSource
        
        // タイムラインセルを登録
        let timeLineNib = UINib(nibName: NibNames.TimeLineCellNib.rawValue, bundle: nil)
        detailTableView.registerNib(timeLineNib, forCellReuseIdentifier: ViewIdentifiers.TimeLineCell.rawValue)
        
        // コメントセルを登録
        let commentNib = UINib(nibName: NibNames.TimeLineCommentCellNib.rawValue, bundle: nil)
        detailTableView.registerNib(commentNib, forCellReuseIdentifier: ViewIdentifiers.TimeLineCommentCell.rawValue)
    }
    
    
}
