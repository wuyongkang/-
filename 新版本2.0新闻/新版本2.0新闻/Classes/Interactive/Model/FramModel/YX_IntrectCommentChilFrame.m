//
//  YX_IntrectCommentChilFrame.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentChilFrame.h"
#import "YX_IntrectComentToolFrame.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectCommentChildModel.h"
#import "YX_intrectChildListModel.h"
@implementation YX_IntrectCommentChilFrame

- (void)setModel:(YX_IntrectCommentModel *)model
{
    _model  = model;
    
    CGFloat leftMargin = 59;
    CGFloat margin = 11;
    CGFloat rightMargin  = 16;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName]= [UIFont systemFontOfSize:14];
    
    YX_IntrectComentToolFrame *ToolFrame = [[YX_IntrectComentToolFrame alloc] init];
    
    ToolFrame.model = model;
    self.comentToolFrame.frame = ToolFrame.frame;
    
    YX_IntrectCommentChildModel *chilModel = model.child;
//    - margin - rightMargin
    CGFloat maxWidth = YX_ScreenWidth - leftMargin ;
    
    CGFloat ToolFrameY = CGRectGetMaxY(ToolFrame.frame);

    YX_intrectChildListModel *listModel = chilModel.list.firstObject;
   
    CGSize size = [listModel.content sizeWithAttributes:dict];
  
    CGFloat x = leftMargin + margin;
    CGFloat height = 0;
    if (chilModel.list.count == 1) {
    
        self.oneCommentFrame = CGRectMake(x, ToolFrameY + margin, maxWidth, size.height);
        CGFloat moreY = CGRectGetMaxY(self.oneCommentFrame) +margin;
        
        self.moreCommentFrame = CGRectMake(x, moreY, 100, 30);
        
        height = 50;
    
    }else if(chilModel.list.count >= 2){
        
        self.oneCommentFrame = CGRectMake(x, ToolFrameY + margin, maxWidth, size.height);
        
        CGFloat twoY = CGRectGetMaxY(self.oneCommentFrame) + margin;
        
        self.twoCommentFrame = CGRectMake(x, twoY, maxWidth, size.height);
        CGFloat moreY = CGRectGetMaxY(self.twoCommentFrame) + margin;
        self.moreCommentFrame = CGRectMake(x, moreY, 100, 30);
        height = 70;
    }
   
    self.frame = CGRectMake(leftMargin, ToolFrameY, maxWidth, height);
}
@end 
