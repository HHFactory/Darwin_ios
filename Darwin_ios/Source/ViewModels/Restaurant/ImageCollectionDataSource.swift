//
//  ImageCollectionDataSource.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/08.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class ImageCollectionDataSource: NSObject, UICollectionViewDataSource {

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCollectionCell", forIndexPath: indexPath) as! ImageCollectionCell
        cell.testLabel.text = "\(indexPath.item)"
        return cell
    }
    
}
