//
//  YX_IntrectCommentChilFrame.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YX_IntrectCommentModel,YX_IntrectComentToolFrame;

@interface YX_IntrectCommentChilFrame : NSObject

@property (nonatomic,strong) YX_IntrectCommentModel *model;

@property (nonatomic,strong) YX_IntrectComentToolFrame *comentToolFrame;

@property (nonatomic,assign) CGRect  frame;
//第一条评论

@property (nonatomic,assign) CGRect  oneCommentFrame;
//有更多评论

@property (nonatomic,assign) CGRect  moreCommentFrame;
//第二条评论
@property (nonatomic,assign) CGRect  twoCommentFrame;

@end
