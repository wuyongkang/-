//
//  YX_IntrectComentToolFrame.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YX_IntrectCommentModel,YX_IntrectCommentHFrame;
@interface YX_IntrectComentToolFrame : NSObject

@property (nonatomic,strong) YX_IntrectCommentModel *model;

@property (nonatomic,assign) CGRect  frame;

@property (nonatomic,strong) YX_IntrectCommentHFrame  *commentHFrame;


@end
