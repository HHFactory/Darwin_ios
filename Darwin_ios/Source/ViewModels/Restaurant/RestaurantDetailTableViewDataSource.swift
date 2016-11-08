//
//  RestaurantDetailTableViewDataSource.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/02.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import Foundation
import UIKit

class RestaurantDetailTableViewDataSource: NSObject, UITableViewDataSource {
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 10
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("restaurantDetailTopCell", forIndexPath: indexPath) as! DetailTableViewCell
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(ViewIdentifiers.RestaurantDetailCell.rawValue, forIndexPath: indexPath) as! RestaurantDetailCell
            return cell
        }
    }
    
    
}
