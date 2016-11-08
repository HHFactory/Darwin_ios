//
//  RestaurantDetailCategoryBarViewController.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/02.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class RestaurantDetailCategoryBarViewController: UIViewController {

    @IBOutlet var categoryBarCollectionView: UICollectionView!
    private let categoryDataSouce = RestaurantDetailCategoryCollectionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryBarCollectionView.dataSource = categoryDataSouce
        categoryBarCollectionView.delegate = self
        
        // cellを登録
        let cellNib = UINib(nibName: NibNames.LabelOnlyCell.rawValue, bundle: nil)
        categoryBarCollectionView.registerNib(cellNib, forCellWithReuseIdentifier: ViewIdentifiers.RestaurantDetailCategoryBarCell.rawValue)
    }
}


extension RestaurantDetailCategoryBarViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.item)がタップされた")
    }
    
}

extension RestaurantDetailCategoryBarViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.width/3, 50.0)
    }
}