//
//  YX_CommentModel.h
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/3/1.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YX_BaseModel.h"
@class YX_IntrectCommentChildModel;
@interface YX_CommentModel : YX_BaseModel

//下一页URL
@property (nonatomic,copy) NSString *nextUrl;
//是否有下一页
@property (nonatomic,assign) NSInteger  hasNext;

@property (nonatomic,strong) NSArray *list;
@end
