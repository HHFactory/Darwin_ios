
/**
 テストデータ
 
 */

import Foundation
import UIKit

class TestData {
    
    typealias ViewModel = (menuTitle: String, content: String, themeColor: UIColor)
    
    static let sharedInstance = TestData()
    
    let data: [ViewModel] = [
        (menuTitle: "長めのカテゴリ名0", content: "コンテンツ1",  themeColor: UIColor.redColor()),
        (menuTitle: "もうちょい長めカテゴリ名1", content: "コンテンツ2",  themeColor: UIColor.greenColor()),
        (menuTitle: "カテゴリ名2", content: "コンテンツ3",  themeColor: UIColor.purpleColor()),
        (menuTitle: "短め3", content: "コンテンツ4",  themeColor: UIColor.yellowColor()),
        (menuTitle: "カテゴリ名4", content: "コンテンツ5",  themeColor: UIColor.cyanColor()),
        (menuTitle: "カテゴリ名5", content: "コンテンツ6",  themeColor: UIColor.grayColor())
    ]
}
