
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

// レストラン詳細画面のpageView生成クラス
class DetailPageContentSettings {
    
    /**
     レストラン詳細画面をタブ数分生成する
     
     
     - returns: <#return value description#>
     */
    func generateViewControllerList() -> [UIViewController] {
        var contentPages: [UIViewController] = []
        
        for count in 0..<DetailTabNames.count {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(StoryBoardIds.RestaurantDetailContentView.rawValue) as! RestaurantDetailContentViewController
            vc.pageIndex = count
            contentPages.append(vc)
        }
        return contentPages        
    }
    
}