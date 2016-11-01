/**
 ホームタブContainerView用VC
 2つのContainerViewを保持し、下記を格納する
    画面上部:カテゴリ表示用CollectionView
    画面下部:コンテンツ表示用CollectionView
 
 当クラスの役割：embed segueと各VCの紐付け
 CategorySelectedDelegate処理を行う
*/

import UIKit

class HomeContainerViewController: UIViewController {
    
    private var categoryBarViewController: CategoryBarViewController?
    private var contentPageViewController: HomeContentPageViewController?
    
    /**
     初期化処理
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     詳細画面から戻ってくる際にnavigationBarを非表示にする
     
     - parameter animated: <#animated description#>
     */
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    /**
     storyboardでsegueで紐付いているものを登録する
     
     - parameter segue:  <#segue description#>
     - parameter sender: <#sender description#>
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? CategoryBarViewController where segue.identifier == SegueNames.EmbedCategoryBar.rawValue {
            categoryBarViewController = vc
            categoryBarViewController?.categorySelectedDelegate = self
        }
            
        else if let vc = segue.destinationViewController as? HomeContentPageViewController where segue.identifier == SegueNames.EmbedContentView.rawValue {
            contentPageViewController = vc
            contentPageViewController?.categorySelectedDelegate = self
        }
    }

}


extension HomeContainerViewController: CategorySelectedDelegate {
    
    /**
     ページめくり開始時の処理
     */
    func setOffsetCurrentCell() {
        var currentItem = 0
        do {
            try currentItem = (categoryBarViewController?.getCurrentIndex())!
        } catch {
            currentItem = (categoryBarViewController?.currentCategoryItem)!
        }

        let currentCellIndex = NSIndexPath(forItem: currentItem, inSection: 0)
        categoryBarViewController?.focusCell(currentCellIndex, animated: false)
    }
    
    
    /**
     選択されたカテゴリに合わせて、適切なページを表示させる
     カテゴリ選択時に呼び出されるdelegateメソッド
     
     - parameter index: <#index description#>
     */
    func focusTargetPage(targetPageItem targetPageItem: Int, scrollDirection: UIPageViewControllerNavigationDirection) {
        // 現在ページと選択したカテゴリindexが同じ場合は処理しない
        if targetPageItem == PageIndex.current {
            return
        }

        // 選択されたカテゴリindexに対応するページを表示させる
        contentPageViewController?.setViewControllers([(contentPageViewController?.pageGenerator.generateViewControllerList()[targetPageItem])!], direction: scrollDirection, animated: true, completion: nil)
        
        // pageVCの現在indexを選択したカテゴリindexで更新する
        PageIndex.updateIndex(targetPageItem)
    }
    
    /**
     ページめくりにあわせて、適切なカテゴリセルまでカテゴリバーをスクロールさせる
     ページをめくっている際に呼び出される
     
     - parameter index: <#index description#>
     */
    func scrollToTargetCategoryItem(scrollRate: CGFloat, direction: UIPageViewControllerNavigationDirection) {
        categoryBarViewController?.scrollOffset(scrollRate, direction: direction)
    }
    
    /**
     対象のカテゴリセルをフォーカスする
     ページめくり完了後の処理のため、現在のセルから左右どちらかのセルにしかフォーカスがあたらない
     
     - parameter index: 現在表示されているページindex
     */
    func focusTargetCategoryItem(currentPageIndex currentPageIndex: Int) {
        
        // ページめくり時は、カテゴリindexは要素群で指定
        let targetCategoryIndexPath = NSIndexPath(forItem: currentPageIndex+CategoryIndex.categoryCount, inSection: 0)

        // 対象セルにフォーカスを当てる
        categoryBarViewController?.focusCell(targetCategoryIndexPath, animated: false)
    }
    
    
}
