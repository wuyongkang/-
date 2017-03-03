//
//  YX_IntrectZTModel.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_BaseModel.h"

@interface YX_IntrectZTModel : YX_BaseModel
//结束时间
@property (nonatomic,copy) NSString *end_time;
// 开始时间
@property (nonatomic,copy) NSString *create_time;
// ID
@property (nonatomic,copy) NSString *ID;
// 互动类型
@property (nonatomic,copy) NSString *type_name;
// 标题
@property (nonatomic,copy) NSString *title;
// 加入人数
@property (nonatomic,assign) NSInteger join_count;
// 介绍
@property (nonatomic,copy) NSString *intro;
// 图片URL
@property (nonatomic,strong) NSURL *img_url;
// 类型
@property (nonatomic,copy) NSString *type;
// 状态
@property (nonatomic,assign) NSInteger state;
// 开始时间
@property (nonatomic,copy) NSString *begin_time;


@end
