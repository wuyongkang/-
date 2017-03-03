//
//  YX_IntrectDetailCellFrameModel.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YX_IntrectCommentModel,YX_IntrectCommentHFrame,YX_IntrectComentToolFrame,YX_IntrectCommentChilFrame;

@interface YX_IntrectDetailCellFrameModel : NSObject

@property (nonatomic,assign) CGFloat  height;

@property (nonatomic,strong) YX_IntrectCommentModel *model;

@property (nonatomic,strong) YX_IntrectCommentHFrame *commentHFrame;

@property (nonatomic,strong) YX_IntrectComentToolFrame  *comentToolFrame;

@property (nonatomic,strong) YX_IntrectCommentChilFrame  *commentChilFrame;


@end
