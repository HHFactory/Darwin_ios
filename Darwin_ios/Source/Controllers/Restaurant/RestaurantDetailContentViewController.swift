//
//  RestaurantDetailContentViewController.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/02.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class RestaurantDetailContentViewController: UIViewController {

    @IBOutlet var contentTableView: UITableView!
    private let tableDataSource = RestaurantDetailTableViewDataSource()
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTableView.dataSource = tableDataSource
        contentTableView.delegate = self
        
        // xibで作成したカスタムセルを登録する
//        let topImageNib = UINib(nibName: NibNames.RestaurantDetailTopImageCellNib.rawValue, bundle: nil)
//        contentTableView.registerNib(topImageNib, forCellReuseIdentifier: ViewIdentifiers.RestaurantDetailTopCell.rawValue)

        let detailNib = UINib(nibName: NibNames.RestaurantDetailCell.rawValue, bundle: nil)
        contentTableView.registerNib(detailNib, forCellReuseIdentifier: ViewIdentifiers.RestaurantDetailCell.rawValue)        
    }
}


extension RestaurantDetailContentViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 190.0
        }
        else {
            return 50.0
        }
    }
}
