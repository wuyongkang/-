//
//  YX_IntrectComentToolFrame.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectComentToolFrame.h"
#import "YX_IntrectCommentHFrame.h"
#import "YX_IntrectCommentModel.h"
@implementation YX_IntrectComentToolFrame

- (void)setModel:(YX_IntrectCommentModel *)model
{
    _model = model;
    CGFloat margin  = 59;
    CGFloat height = 32;
    YX_IntrectCommentHFrame *commentHFrame = [[YX_IntrectCommentHFrame alloc] init];
    commentHFrame.model = model;
    self.commentHFrame = commentHFrame;
    CGFloat y = CGRectGetMaxY(commentHFrame.frame);
    
    self.frame = CGRectMake(margin, y, YX_ScreenWidth - margin - 16, height);
    
}
@end
