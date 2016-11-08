//
//  RestaurantDetailCategoryCollectionDataSource.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/07.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class RestaurantDetailCategoryCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ViewIdentifiers.RestaurantDetailCategoryBarCell.rawValue, forIndexPath: indexPath) as! LabelOnlyCell
        cell.centerLabel.text = DetailTabNames.allCategorys[indexPath.item].rawValue
        return cell
    }
    
}
