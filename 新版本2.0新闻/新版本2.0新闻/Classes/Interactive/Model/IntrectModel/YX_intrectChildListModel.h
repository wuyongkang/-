//
//  YX_intrectChildListModel.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_BaseModel.h"
@class YX_IntrectCommentChildModel;
@interface YX_intrectChildListModel : YX_BaseModel

//"top_id": "0", －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－顶级评论id

@property (nonatomic,copy) NSString *top_id;
//"parent_id": "0",－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－父级评论id
@property (nonatomic,copy) NSString *parent_id;

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *user_name;
@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) NSString *parent_user_name;

@property (nonatomic,copy) NSString *parent_user_id;

@property (nonatomic,copy) NSString *support;

@property (nonatomic,copy) NSString *user_id;
// 是否自己点赞过
@property (nonatomic,assign) NSInteger  user_support;

@property (nonatomic,strong) YX_IntrectCommentChildModel *child;

@property (nonatomic,strong) NSURL *portrait_url;

@property (nonatomic,copy) NSString *create_time;
@end
