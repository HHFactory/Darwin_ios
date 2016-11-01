//
//  ViewAttributes.swift
//  Darwin_ios
//
//  Created by hide on 2016/10/27.
//  Copyright © 2016年 HHFactory. All rights reserved.
//

import Foundation
import UIKit

struct CategoryIndex {
    static var categoryCount = 0
    static var currentItem   = 0
}

struct PageIndex {
    static var current = 0
    static var before = CategoryIndex.categoryCount-1
    static var next = 1
    
    static func updateIndex(at: Int) {
        current = at
        before = (current == 0) ? CategoryIndex.categoryCount-1 : current-1
        next = (current == CategoryIndex.categoryCount-1) ? 0 : current+1
    }
}

// ひろば画面用セルサイズパターン定義クラス
class CellPattern {
    private var bigCell: CGSize
    private var smallCell: CGSize
    private var sectionHeight: CGFloat
    
    init(basisCellSize: CGFloat) {
        bigCell = CGSize(width: basisCellSize*2.0, height: basisCellSize*2.0)
        smallCell = CGSize(width: basisCellSize, height: basisCellSize)
        sectionHeight = basisCellSize*3.0
    }
    
    /**
     奇数セクションでのセル配置を設定する
     
     - parameter itemCountInSection: <#itemCountInSection description#>
     - parameter indexPath:          <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func makeCellRectAtOddSection(itemCountInSection: Int, indexPath:NSIndexPath) -> CGRect{
        var cellRect = CGRectZero
        
        // 最初のセルを大セルに設定
        if (indexPath.item % itemCountInSection == 0){
            let position = CGPoint(x: 0.0, y: sectionHeight * CGFloat(indexPath.section))
            cellRect = CGRect(origin: position, size: bigCell)
        }
        // 2番目のセルは小セルを大セルの横に配置
        else if (indexPath.item % itemCountInSection == 1) {
            let position = CGPoint(x: bigCell.width, y: sectionHeight * CGFloat(indexPath.section))
            cellRect = CGRect(origin: position, size: smallCell)
        }
        // 3番目のセルは2番目セルの下に配置
        else if (indexPath.item % itemCountInSection == 2) {
            let position = CGPoint(x: bigCell.width, y: sectionHeight * CGFloat(indexPath.section) + smallCell.height)
            cellRect = CGRect(origin: position, size: smallCell)
        }
        // それ以降のセルは大セル下に横並び
        else {
            let position = CGPoint(x: smallCell.width * CGFloat(indexPath.item % 3),
                                   y: sectionHeight * CGFloat(indexPath.section) + bigCell.height)
            cellRect = CGRect(origin: position, size: smallCell)
        }
        
        return cellRect
    }
    
    /**
     偶数sectionでのセル配置を設定する
     
     - parameter itemCountInSection: <#itemCountInSection description#>
     - parameter indexPath:          <#indexPath description#>
     
     - returns: <#return value description#>
     */
    func makeCellRectAtEvenSection(itemCountInSection: Int, indexPath:NSIndexPath) -> CGRect{
        var cellRect = CGRectZero
        
        // 最初のセルを小セルに設定
        if (indexPath.item % itemCountInSection == 0){
            let position = CGPoint(x: 0.0, y: sectionHeight * CGFloat(indexPath.section))
            cellRect = CGRect(origin: position, size: smallCell)
        }
        // 2番目のセルは大セルに設定
        else if (indexPath.item % itemCountInSection == 1) {
            let position = CGPoint(x: smallCell.width, y: sectionHeight * CGFloat(indexPath.section))
            cellRect = CGRect(origin: position, size: bigCell)
        }
        // 3番目のセルは1番目セルの下に配置
        else if (indexPath.item % itemCountInSection == 2) {
            let position = CGPoint(x: 0.0, y: sectionHeight * CGFloat(indexPath.section) + smallCell.height)
            cellRect = CGRect(origin: position, size: smallCell)
        }
        // それ以降のセルは大セル下に横並び
        else {
            let position = CGPoint(x: smallCell.width * CGFloat(indexPath.item % 3),
                                   y: sectionHeight * CGFloat(indexPath.section) + bigCell.height)
            cellRect = CGRect(origin: position, size: smallCell)
        }
        return cellRect
    }
}

