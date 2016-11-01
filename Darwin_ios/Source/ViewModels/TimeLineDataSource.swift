
/**
 タイムラインtableView用DataSource
 */


import UIKit

class TimeLineDataSource: NSObject, UITableViewDataSource{
    
    /**
     セクション数を設定する
     
     - parameter tableView: <#tableView description#>
     
     - returns: <#return value description#>
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    /**
     セクション内の行数を設定する
     
     - parameter tableView: <#tableView description#>
     - parameter section:   <#section description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //test
    }
    
    
    /**
     表示するセルの設定
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ViewIdentifiers.TimeLineCell.rawValue, forIndexPath: indexPath) as! TimeLineViewCell
        return cell
    }
}
