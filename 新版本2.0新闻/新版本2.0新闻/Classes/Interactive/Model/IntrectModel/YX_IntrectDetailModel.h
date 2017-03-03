//
//  YX_IntrectDetailModel.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_BaseModel.h"
@class YX_IntrectDeatilHModel;
@interface YX_IntrectDetailModel : YX_BaseModel
// 详情
@property (nonatomic,strong) YX_IntrectDeatilHModel *detail;
//评论列表
@property (nonatomic,strong) NSArray *comment;

@property (nonatomic,assign) NSInteger  hasNext;

@property (nonatomic,copy) NSString *nextUrl;

@end
