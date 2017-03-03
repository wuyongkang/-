//
//  YX_IntrectDetailCellFrameModel.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectDetailCellFrameModel.h"
#import "YX_IntrectCommentHFrame.h"
#import "YX_IntrectComentToolFrame.h"
#import "YX_IntrectCommentChilFrame.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectCommentChildModel.h"
#import "YX_intrectChildListModel.h"

@implementation YX_IntrectDetailCellFrameModel

- (void)setModel:(YX_IntrectCommentModel *)model
{
    _model  = model;
    YXLog(@"%ld",(long)model.child_count);
    
    
    CGFloat margin = 16;
    [self setupCommentHFrame];
    
    
    [self setupCommentToolFrame];
    
  
    if (model.child_count) {
         [self setupChilCommentFrame];
        self.height = CGRectGetMaxY(self.commentChilFrame.frame) + margin;
    }else{
        self.height = CGRectGetMaxY(self.comentToolFrame.frame) + margin;
    }
   
}

- (void)setupCommentHFrame
{
    YX_IntrectCommentHFrame *commentHFrame = [[YX_IntrectCommentHFrame alloc] init];
    commentHFrame.model  = self.model;
    self.commentHFrame = commentHFrame;
}

- (void)setupCommentToolFrame
{
    YX_IntrectComentToolFrame *frameModel = [[YX_IntrectComentToolFrame alloc] init];
    frameModel.model = self.model;
    self.comentToolFrame =   frameModel;
//     YXLog(@"%@",NSStringFromCGRect(frameModel.frame));
}

- (void)setupChilCommentFrame
{
    YX_IntrectCommentChilFrame *frameModel = [[YX_IntrectCommentChilFrame alloc] init];
    frameModel.model = self.model;
    self.commentChilFrame = frameModel;
   
}
@end
