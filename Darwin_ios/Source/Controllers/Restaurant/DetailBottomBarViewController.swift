//
//  DetailBottomBarView.swift
//  Darwin_ios
//
//  Created by hide on 2016/11/07.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import UIKit

class DetailBottomBarViewController: UIViewController {

        
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var delegate: BottomTabClickedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
