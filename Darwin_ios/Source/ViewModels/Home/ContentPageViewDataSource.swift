
/**
 ホームタブ画面下部コンテンツ表示用PageView.DataSource
 1ページ前、1ページ次のviewを指定する
 
 このメソッドの中でpageVCのindex、pageViewのindexを更新しないこと。
 indexの更新はページをめくり終わった後の処理で行う。
 
 */

import UIKit

class ContentPageViewDataSource: NSObject, UIPageViewControllerDataSource {
    
    
    /**
     1ページ前を設定する処理
     ページを戻した際に呼ばれる
     before→after→beforeの順で２回呼ばれる
     
     
     - parameter pageViewController: <#pageViewController description#>
     - parameter viewController:     <#viewController description#>
     
     - returns: <#return value description#>
     */
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let pageVc = pageViewController as? HomeContentPageViewController else {
            return nil
        }
        
        if viewController.isKindOfClass(HomeContentViewController) {
            let contentPages: [UIViewController] = pageVc.pageGenerator.generateViewControllerList()
            return contentPages[PageIndex.before]
        }
        return nil
    }
    
    
    /**
     1ページ次を設定する処理
     ページを次にめくった際によばれる。
     after→before→afterで２回呼ばれる
     
     - parameter pageViewController: <#pageViewController description#>
     - parameter viewController:     <#viewController description#>
     
     - returns: <#return value description#>
     */
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let pageVc = pageViewController as? HomeContentPageViewController else {
            return nil
        }
        
        if viewController.isKindOfClass(HomeContentViewController) {
            let contentPages: [UIViewController] = pageVc.pageGenerator.generateViewControllerList()
            return contentPages[PageIndex.next]
        }
        return nil
    }
    
    
}
