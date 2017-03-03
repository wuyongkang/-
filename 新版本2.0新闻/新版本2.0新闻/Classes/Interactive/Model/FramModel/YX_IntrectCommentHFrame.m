//
//  YX_IntrectCommentHFrame.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentHFrame.h"
#import "YX_IntrectCommentModel.h"
@implementation YX_IntrectCommentHFrame

- (void)setModel:(YX_IntrectCommentModel *)model
{
    _model = model;
    
    CGFloat margin = 16;
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    self.iconFrame = CGRectMake(margin, margin, iconW, iconH);
    
    CGFloat Nmargin = 12;
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + Nmargin;
    CGFloat nameY = margin ;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
   
    CGSize size  = [model.user_name sizeWithAttributes:dict];
    self.nameFrame = CGRectMake(nameX, nameY, size.width, size.height);
    
    CGFloat timeX = nameX;
    
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + 5;

    CGSize timeSize = [model.create_time sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
    self.timeFrame = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    CGFloat contentMaxW = YX_ScreenWidth - nameX - margin;
    
    CGSize contentSize = [model.content boundingRectWithSize:CGSizeMake(contentMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    CGFloat contentY = CGRectGetMaxY(self.timeFrame) + margin;
    self.contentFrame =  CGRectMake(nameX, contentY, contentSize.width, contentSize.height);
    
    CGFloat height = CGRectGetMaxY(self.contentFrame) +margin;
    
    self.frame = CGRectMake(0, 0, YX_ScreenWidth, height);
    
//    YXLog(@"%@",NSStringFromCGRect(self.frame));
    
}

@end
