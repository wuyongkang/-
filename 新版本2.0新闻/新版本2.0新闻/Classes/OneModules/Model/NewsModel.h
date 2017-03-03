//
//  NewsModel.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/30.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

/*cell字段*/
@property (nonatomic, strong) NSString *layoutType; //类型

/*
 taype == 1
 */
@property (nonatomic, strong) NSString * CELLID; //文章ID
@property (nonatomic, strong) NSString * url; //详情
@property (nonatomic, strong) NSString * title; //标题
@property (nonatomic, strong) NSString * img; //图片
@property (nonatomic, strong) NSString * commentCount; //评论
@property (nonatomic, strong) NSString * supportCount; //点赞
@property (nonatomic, strong) NSString * createTime; //时间
@property (nonatomic, strong) NSString * channelName; //频道



//轮播图


//@property (nonatomic, strong) NSString * title; //图片
//@property (nonatomic, strong) NSString * image; //图片
//@property (nonatomic, strong) NSString * image; //图片
//@property (nonatomic, strong) NSString * image; //图片



@end
