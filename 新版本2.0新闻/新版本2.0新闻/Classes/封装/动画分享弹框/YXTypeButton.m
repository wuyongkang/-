//
//  YXTypeButton.m
//  Bow
//
//  Created by 李元喜 on 16/12/2.
//  Copyright © 2016年 Chao. All rights reserved.
//

#import "YXTypeButton.h"

@implementation YXTypeButton



/**
 *  设置按钮
 *
 *  @param image 按钮图片
 *  @param title 按钮标题
 *  @param color 按钮颜色
 *  @param state 状态
 */
- (void)setMyTypeButtonImage:(UIImage *)image withTitle:(NSString *)title withTitleColor:(UIColor *)color forState:(UIControlState)state
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitle:title forState:state];
    [self setTitleColor:color forState:state];
    [self setImage:image forState:state];
    
}



/**
 *  设置按钮
 *
 *  @param image 按钮背景图片
 *  @param title 按钮标题
 *  @param color 按钮颜色
 *  @param state 状态
 */
- (void)setMyTypeButtonBackgroundImage:(UIImage *)image withTitle:(NSString *)title withTitleColor:(UIColor *)color forState:(UIControlState)state
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitle:title forState:state];
    [self setTitleColor:color forState:state];
    [self setBackgroundImage:image forState:state];
    
}

//设置按钮当中图片的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = contentRect.size.width * 0.2;
    CGFloat y = contentRect.size.height * 0.15;
    CGFloat w = contentRect.size.width - x * 2;
    CGFloat h = contentRect.size.height * 0.5;
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = contentRect.size.height * 0.65;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height * 0.3;
    CGRect rect = CGRectMake(x, y, w, h);
    return rect;
}


@end
