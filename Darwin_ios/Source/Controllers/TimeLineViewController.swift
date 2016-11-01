
/**
 タイムラインタブ用VC
 TableViewを配置し、tableViewDelegateを担当する
 */

import UIKit

class TimeLineViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var timeLineTableView: UITableView!
    private let timeLineDataSource = TimeLineDataSource()
    
    /**
     初期化処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = timeLineDataSource

        // xibで作成したカスタムセルを登録する
        let nib = UINib(nibName: NibNames.TimeLineCellNib.rawValue, bundle: nil)
        timeLineTableView.registerNib(nib, forCellReuseIdentifier: ViewIdentifiers.TimeLineCell.rawValue)
    }
    
    
    /**
     セルタップ時処理
     segueでの画面遷移時に渡すパラメータを設定
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(SegueNames.ToTimeLineDetail.rawValue, sender: indexPath)
    }
    
    
    /**
     segueでの画面遷移処理
     
     - parameter segue:  <#segue description#>
     - parameter sender: <#sender description#>
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueNames.ToTimeLineDetail.rawValue {
            _ = segue.destinationViewController as! TimeLineDetailViewController
        }
    }

}
