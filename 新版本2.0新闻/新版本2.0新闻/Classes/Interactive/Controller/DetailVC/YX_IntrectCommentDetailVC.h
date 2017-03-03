//
//  YX_IntrectCommentDetailVC.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "BSViewController.h"
@class YX_IntrectCommentModel;
@interface YX_IntrectCommentDetailVC : BSViewController

@property (nonatomic,strong) YX_IntrectCommentModel *model;

// 互动ID
@property (nonatomic,copy) NSString *ID;

// 评论ID
@property (nonatomic,copy) NSString *commentID;
@end
