//
//  RestaurantDetailPageDataSource.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/02.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import Foundation
import UIKit

class RestaurantDetailPageDataSource: NSObject, UIPageViewControllerDataSource {
    
    
    /**
     一つ前のVCを設定する
     
     - parameter pageViewController: <#pageViewController description#>
     - parameter viewController:     <#viewController description#>
     
     - returns: <#return value description#>
     */
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        guard let pageVc = pageViewController as? RestaurantDetailPageViewController where pageVc.currentPageItem != 0 else {
            return nil
        }
        
        let contentPages = pageVc.pageGenerator.generateViewControllerList()
        print("before:\(pageVc.currentPageItem)")
        return contentPages[pageVc.currentPageItem-1]
        
    }
    
    /**
     １つ次のVCを設定する
     
     - parameter pageViewController: <#pageViewController description#>
     - parameter viewController:     <#viewController description#>
     
     - returns: <#return value description#>
     */
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let pageVc = pageViewController as? RestaurantDetailPageViewController where pageVc.currentPageItem != 2 else {
            return nil
        }
        
        let contentPages = pageVc.pageGenerator.generateViewControllerList()
        print("after:\(pageVc.currentPageItem)")
        return contentPages[pageVc.currentPageItem+1]
    }
    
}
