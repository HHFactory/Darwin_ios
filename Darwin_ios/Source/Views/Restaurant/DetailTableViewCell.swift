//
//  DetailTableViewCell.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/08.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    private let imageCollectionDataSource = ImageCollectionDataSource()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCollectionView.dataSource = imageCollectionDataSource
        
        let cellNib = UINib(nibName: "ImageCollectionCell", bundle: nil)
        imageCollectionView.registerNib(cellNib, forCellWithReuseIdentifier: "imageCollectionCell")
        
    }

}
