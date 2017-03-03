//
//  YX_IntrectCommentModel.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_BaseModel.h"
@class YX_IntrectCommentChildModel;
@interface YX_IntrectCommentModel : YX_BaseModel



@property (nonatomic,copy) NSString *ID;

//互动ID
@property (nonatomic,copy) NSString *hd_id;
// 评论内容
@property (nonatomic,copy) NSString *content;
//"user_id": 用户id
@property (nonatomic,copy) NSString *user_id;
//"parent_user_name":父级评论用户昵称
@property (nonatomic,copy) NSString *parent_user_name;

//"parent_id": 父级评论id
@property (nonatomic,copy) NSString *parent_id;
//"support":评论点赞数
@property (nonatomic,assign) NSInteger  support;

//"user_name": 用户名称
@property (nonatomic,copy) NSString *user_name;



//"create_time":创建时间
@property (nonatomic,copy) NSString *create_time;

//"portrait_url":－头像地址
@property (nonatomic,strong) NSURL *portrait_url;

//"user_support": 登录用户是否已点赞(0:未点赞 1：已点赞)
@property (nonatomic,assign) NSInteger  user_support;

//"top_id":顶级评论id
@property (nonatomic,copy) NSString *top_id;

//"child_count": 子评论数
@property (nonatomic,assign) NSInteger  child_count;


//"parent_user_id":父级评论用户id
@property (nonatomic,copy) NSString *parent_user_id;


@property (nonatomic,strong) YX_IntrectCommentChildModel *child;
@end
