//
//  UIView+Extension.m
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


+ (instancetype)seperator
{
    UIView *s = [[self alloc] init];
    s.backgroundColor = [UIColor blackColor];
    s.alpha = 0.1;
    
    return s;
}


+ (instancetype)containerWithHeight:(CGFloat)height
{
    UIView *s = [[self alloc] init];
//    s.layer.cornerRadius
    s.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height);
    
    return s;
}


- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = YES;
}


- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.clipsToBounds = YES;
}


- (void)setCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    [self setBorderWidth:borderWidth borderColor:borderColor];
    
    [self setCornerRadius:cornerRadius];
}

@end
