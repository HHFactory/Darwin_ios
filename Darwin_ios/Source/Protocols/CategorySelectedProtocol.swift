
/**
 メニュー選択時に使用するプロトコル
 */

import UIKit


protocol CategorySelectedDelegate {
    func focusTargetPage(targetPageItem targetPageItem:Int, scrollDirection: UIPageViewControllerNavigationDirection)
    func scrollToTargetCategoryItem(scrollRate: CGFloat, direction: UIPageViewControllerNavigationDirection)
    func focusTargetCategoryItem(currentPageIndex currentPageIndex: Int)
    func setOffsetCurrentCell()
}