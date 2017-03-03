//
//  YX_IntrectCommentCell.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YX_IntrectDetailCellFrameModel,YX_IntrctCommentToolView;

@interface YX_IntrectCommentCell : UITableViewCell

@property (nonatomic,strong) YX_IntrectDetailCellFrameModel *model;
@property (nonatomic,strong) YX_IntrctCommentToolView *toolView;

@end
