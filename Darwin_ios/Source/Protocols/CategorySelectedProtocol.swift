
/**
 メニュー選択時に使用するプロトコル
 */

import UIKit

// カテゴリ選択処理プロトコル（ホームタブにて使用）
protocol CategorySelectedDelegate {
    func focusTargetPage(targetPageItem targetPageItem:Int, scrollDirection: UIPageViewControllerNavigationDirection)
    func scrollToTargetCategoryItem(scrollRate: CGFloat, direction: UIPageViewControllerNavigationDirection)
    func focusTargetCategoryItem(currentPageIndex currentPageIndex: Int)
    func setOffsetCurrentCell()
}

// 詳細画面下部のボタンクリック時プロトコル（レストラン詳細画面にて使用）
protocol BottomTabClickedDelegate {
    func closePage()
}