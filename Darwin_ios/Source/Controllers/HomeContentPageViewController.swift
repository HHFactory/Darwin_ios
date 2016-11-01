
/**
 ホームタブ下部のコンテンツ表示用PageViewController
 
 */

import UIKit

class HomeContentPageViewController: UIPageViewController {

    let pageViewDataSource: UIPageViewControllerDataSource? = ContentPageViewDataSource()
    var categorySelectedDelegate: CategorySelectedDelegate?
    var scrollBeginPoint = CGPointZero
    let pageGenerator = PageContentSettings()
    
    /**
     初期化処理
     コンテンツページのdatasourceと、delegateを設定する
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = pageViewDataSource
        self.delegate = self
        
        // PageContentSetttingsStructで生成したページの1ページ目を設定
        self.setViewControllers([pageGenerator.generateViewControllerList().first!], direction: .Forward, animated: true, completion: nil)
        
        // コンテンツページをスクロールした際の処理をこのクラスで担当する
        for sv in self.view.subviews{
            if sv.isKindOfClass(UIScrollView) {
                (sv as! UIScrollView).delegate = self
                break
            }
        }
    }
    
}


extension HomeContentPageViewController: UIScrollViewDelegate {

    /**
     ページをめくり始めた際の処理
     スクロール開始ポイントを把握する
     
     - parameter scrollView:
     */
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollBeginPoint = scrollView.contentOffset
        // フォーカスされていないセルが画面に表示されている場合があるため、現在セルにフォーカスをあてる
        categorySelectedDelegate?.setOffsetCurrentCell()
    }
    
    /**
     ページをめくっている最中の処理
     カテゴリーバーも同じ方向に同じ比率でスクロールさせる
     
     - parameter scrollView: <#scrollView description#>
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        guard scrollBeginPoint != CGPointZero else {
            return
        }
        
        // ページをどれぐらいめくっているか、画面サイズに合わせた比率を計算する
        let scrollRate: CGFloat = (scrollView.contentOffset.x-scrollBeginPoint.x)/scrollView.frame.width
        
        // スクロール開始ポイントと比較して、めくっている方向を計算し通知する
        if scrollView.contentOffset.x > scrollBeginPoint.x {
            categorySelectedDelegate?.scrollToTargetCategoryItem(scrollRate, direction: .Forward)
        } else {
            categorySelectedDelegate?.scrollToTargetCategoryItem(scrollRate, direction: .Reverse)
        }
    }
    

}

extension HomeContentPageViewController: UIPageViewControllerDelegate {

    /**
     ページをめくり終えた際の処理
     めくった後の画面indexを取得し、カテゴリバーも適切なセルにフォーカスをあてる
     
     - parameter pageViewController:      <#pageViewController description#>
     - parameter finished:                <#finished description#>
     - parameter previousViewControllers: <#previousViewControllers description#>
     - parameter completed:               <#completed description#>
     */
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        // めくった後に表示されている画面のindexを取得
        guard let contentVc = pageViewController.viewControllers?.first as? HomeContentViewController else {
            fatalError("not found contentPage")
        }

        // 各種index値を更新
        PageIndex.updateIndex(contentVc.pageIndex)
        
        // どのセルにフォーカスを当てるのか、カテゴリバーにインデックスを通知（セルへのフォーカスはカテゴリバーが担当）
        categorySelectedDelegate?.focusTargetCategoryItem(currentPageIndex: PageIndex.current)
        // スクロール開始点を元に戻す
        scrollBeginPoint = CGPointZero
    }
    
}
