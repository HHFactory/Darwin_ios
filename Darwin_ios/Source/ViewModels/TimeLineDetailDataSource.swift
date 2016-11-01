
/**
 タイムライン詳細画面TableView.DataSource
 
 */

import UIKit


class TimeLineDetailDataSource: NSObject, UITableViewDataSource {
    
    
    /**
     セクション数の設定
     
     - parameter tableView: <#tableView description#>
     
     - returns: <#return value description#>
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    /**
     セクション内行数の設定
     
     - parameter tableView: <#tableView description#>
     - parameter section:   <#section description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 10 //test
        }
    }
    
    
    /**
     表示するセルの設定
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(ViewIdentifiers.TimeLineCell.rawValue, forIndexPath: indexPath) as! TimeLineViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(ViewIdentifiers.TimeLineCommentCell.rawValue, forIndexPath: indexPath) as! TimeLineCommentCell
            return cell
        }
        
        
    }
}
