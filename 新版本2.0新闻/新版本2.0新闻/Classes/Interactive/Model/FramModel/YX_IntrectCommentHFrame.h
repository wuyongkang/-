//
//  YX_IntrectCommentHFrame.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YX_IntrectCommentModel;

@interface YX_IntrectCommentHFrame : NSObject

@property (nonatomic,strong) YX_IntrectCommentModel *model;
// frame
@property (nonatomic,assign) CGRect  frame;

@property (nonatomic,assign) CGRect  iconFrame;

@property (nonatomic,assign) CGRect  nameFrame;

@property (nonatomic,assign) CGRect timeFrame;

@property (nonatomic,assign) CGRect  contentFrame;

@end
