//
//  YX_IntrectDeatilHModel.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_BaseModel.h"

@interface YX_IntrectDeatilHModel : YX_BaseModel

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *title;
// 话题结束时间
@property (nonatomic,copy) NSString *end_time;
// 话题开始时间
@property (nonatomic,copy) NSString *create_time;

@property (nonatomic,copy) NSString *type_name;

@property (nonatomic,copy) NSString *intro;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,assign) NSInteger  join_count;

@property (nonatomic,strong) NSURL *img_url;


@property (nonatomic,copy) NSString *state;

@property (nonatomic,assign) NSInteger begin_time;

@property (nonatomic,copy) NSString *share_url;

@property (nonatomic,copy) NSString *share_title;
@end
