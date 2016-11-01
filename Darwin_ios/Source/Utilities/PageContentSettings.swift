
/**
 */

import UIKit
import Foundation


class PageContentSettings {
    
    /**
     UIPageViewのコンテンツVCを生成
     
     - returns: <#return value description#>
     */
    func generateViewControllerList() -> [UIViewController] {
        var contentPages: [UIViewController] = []
        
        for count in 0..<TestData.sharedInstance.data.count {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ContentViewController") as! HomeContentViewController
            vc.view.backgroundColor = TestData.sharedInstance.data[count].themeColor
            vc.pageIndex = count
            contentPages.append(vc)
        }
        return contentPages
    }
    
}