//
//  YXDanMuButton.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/7.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXDanMuButton.h"

@implementation YXDanMuButton

- (void)setFrame:(CGRect)frame
{
    CGFloat margin = 5;
    CGFloat width = 16;
    CGFloat height = width;
    
    self.imageView.height = height;
    
    self.titleLabel.x = margin;
    self.titleLabel.centerY = self.centerY;
    
    self.imageView.centerY = self.centerY;
    self.imageView.width = width;
    //self.imageView.x = self.width
    
    
    [super setFrame:frame];
    
}
@end
