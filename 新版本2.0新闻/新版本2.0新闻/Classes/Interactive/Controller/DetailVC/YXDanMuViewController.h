//
//  YXDanMuViewController.h
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/8.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "BSViewController.h"
@class YX_IntrectDetailModel,YX_IntrectCommentModel;

typedef void(^danMuClick)(YX_IntrectCommentModel *model,CGPoint point);
@interface YXDanMuViewController : BSViewController

@property (nonatomic,strong) NSMutableArray *commentList;

@property (nonatomic,strong) YX_IntrectDetailModel *DetailModel;

// 发送弹幕的信息
@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) danMuClick danMuClick;

- (void)DidclickDanMu:(danMuClick)danMuClick;
@end
