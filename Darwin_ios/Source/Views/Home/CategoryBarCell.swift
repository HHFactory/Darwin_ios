
/**
 ホームタブ画面上部のカテゴリ名表示用Cellクラス
 ラベル名の設定やセルタップ時の文字色を設定する
 設置アイテムがラベルだけなのでxibの作成はしない
 */

import UIKit

class CategoryBarCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryItemLabel: CategoryLabel!
    var cellIndex:Int?

    var isCurrent: Bool = false {
        didSet {
            setFocusColor(isCurrent)
        }
    }
    
    /**
     StoryBoardからの初期化処理
     
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
     セル設定
     カテゴリ名とフォーカス時テキストカラーを設定
     
     */
    func configCell(categoryName: String, isFocus: Bool) {
        categoryItemLabel.text = categoryName
        isCurrent = isFocus
    }
    
    /**
     セルのフォーカス設定
     フォーカス時:白
     アンフォーカス時:グレー
     
     - parameter active: active description
     */
    func setFocusColor(active: Bool) {
        let textColor = active ? UIColor.whiteColor() : UIColor.grayColor()
        let backgroundColor = active ? UIColor.orangeColor() : UIColor.clearColor()
        
        categoryItemLabel.textColor = textColor
        categoryItemLabel.backgroundColor = backgroundColor
    }
}


/// ラベルにpaddingを設定するため、サブクラス化
class CategoryLabel: UILabel {
    
    let padding = UIEdgeInsetsMake(3.0, 2.0, 3.0, 2.0)
    
    /**
     ラベルにpaddingを設定する
     
     - parameter rect: <#rect description#>
     */
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, padding))
    }
    
    /**
     labelのコンテンツサイズを設定する
     ここでpaddingを含んだサイズを返さないとpaddingが反映されない
     
     - returns: <#return value description#>
     */
    override func intrinsicContentSize() -> CGSize {
        var intrinsicContentSize = super.intrinsicContentSize()
        intrinsicContentSize.height += padding.top + padding.bottom
        intrinsicContentSize.width += padding.left + padding.right
        return intrinsicContentSize
    }
}
