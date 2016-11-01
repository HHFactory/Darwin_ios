
/**
 StoryBoardで使用している各識別子を定義したenum
 
 */

import Foundation

// 各種view識別子を定義
enum ViewIdentifiers: String {
    case CategoryBarCell     = "categoryItemCell"
    case HomeContentViewCell = "contentCell"
    case HirobaImageCell     = "hirobaImageCell"
    case TimeLineCell        = "timeLineCell"
    case TimeLineCommentCell = "commentCell"
}

// 各種xibファイル名を定義
enum NibNames: String {
    case HomeContentCellNib     = "HomeContentCell"
    case HirobaImageCell        = "HirobaImageCell"
    case TimeLineCellNib        = "TimeLineViewCell"
    case TimeLineCommentCellNib = "TimeLineCommentCell"
}

// 各種segue名を定義
enum SegueNames: String {
    case ToRestaurantDetail = "toRestaurantDetailPageSegue"
    case ToTimeLineDetail   = "toTimeLineDetailSegue"
    case EmbedCategoryBar   = "embedCategoryBarSegue"
    case EmbedContentView   = "embedContentViewSegue"
}

