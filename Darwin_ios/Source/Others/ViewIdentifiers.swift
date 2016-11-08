
/**
 StoryBoardで使用している各識別子を定義したenum
 
 */

import Foundation

// 各種view識別子を定義
enum ViewIdentifiers: String {
    case CategoryBarCell                   = "categoryItemCell"
    case HomeContentViewCell               = "contentCell"
    case HirobaImageCell                   = "hirobaImageCell"
    case TimeLineCell                      = "timeLineCell"
    case TimeLineCommentCell               = "commentCell"
    case RestaurantDetailTopCell           = "restaurantDetailTopCell"
    case RestaurantDetailCell              = "restaurantDetailCell"
    case RestaurantImageCollectionViewCell = "imageCollectionViewCell"
    case RestaurantDetailCategoryBarCell   = "detailCategoryBarCell"
}

enum StoryBoardIds: String {
    case RestaurantDetailContentView = "DetailContentView"
}


// 各種xibファイル名を定義
enum NibNames: String {
    case HomeContentCellNib                = "HomeContentCell"
    case HirobaImageCell                   = "HirobaImageCell"
    case TimeLineCellNib                   = "TimeLineViewCell"
    case TimeLineCommentCellNib            = "TimeLineCommentCell"
    case RestaurantDetailTopImageCellNib   = "RestaurantDetailTopImageCell"
    case RestaurantDetailCell              = "RestaurantDetailCell"
    case RestaurantImageCollectionViewCell = "RestaurantImageCollectionViewCell"
    case LabelOnlyCell                     = "LabelOnlyCell"
}

// 各種segue名を定義
enum SegueNames: String {
    case ToRestaurantDetail   = "toRestaurantDetailPageSegue"
    case ToTimeLineDetail     = "toTimeLineDetailSegue"
    case EmbedCategoryBar     = "embedCategoryBarSegue"
    case EmbedContentView     = "embedContentViewSegue"
    case EmbedDetailTabSegue  = "embedDetailTabSegue"
    case EmbedDetailPageSegue = "embedDetailPageSegue"
    case EmbedBottomBarSegue  = "embedBottomBarSegue"
}

// RestaurantDetailで使用するタブ名
enum DetailTabNames:String, Hashable {
    case Review     = "レビュー"
    case Info       = "店舗情報"
    case DetailInfo = "店舗詳細"
    case _count     = "dummy"
    
    static let allCategorys = [Review, Info, DetailInfo]
    
    // enumの数を返す
    static var count: Int {
        return self._count.hashValue
    }
}

