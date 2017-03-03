//
//  YXGuideCell.h
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/21.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YXGuideModel;
@interface YXGuideCell : UITableViewCell
@property (nonatomic,strong) NSIndexPath *idp;

@property (nonatomic,strong) YXGuideModel *model;
@end
