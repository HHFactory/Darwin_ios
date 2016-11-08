//
//  RestaurantDetailPageViewController.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/02.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class RestaurantDetailPageViewController: UIPageViewController {

    private let pageDataSource = RestaurantDetailPageDataSource()
    let pageGenerator = DetailPageContentSettings()
    var currentPageItem = 1
    
    
    /**
     初期化処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = pageDataSource
        self.delegate = self
        
        self.setViewControllers([pageGenerator.generateViewControllerList().first!], direction: .Forward, animated: true, completion: nil)
    }
}


extension RestaurantDetailPageViewController: UIPageViewControllerDelegate {
    
    /**
     ページめくり完了時の処理
     currentPageItemの値を更新し、適切な詳細タブにフォーカスされるようdelegate処理を呼び出す
     
     - parameter pageViewController:      <#pageViewController description#>
     - parameter finished:                <#finished description#>
     - parameter previousViewControllers: <#previousViewControllers description#>
     - parameter completed:               <#completed description#>
     */
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        // めくった後に表示されている画面のindexを取得
        guard let contentVc = pageViewController.viewControllers?.first as? RestaurantDetailContentViewController else {
            fatalError("not found contentPage")
        }
        print("現在:\(contentVc.pageIndex)")
        currentPageItem = contentVc.pageIndex

        
    }
    
    
}
