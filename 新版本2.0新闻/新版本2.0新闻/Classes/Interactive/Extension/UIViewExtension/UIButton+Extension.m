//
//  UIButton+Extension.m
//  WellRead
//
//  Created by bevis on 15/12/21.
//  Copyright © 2015年 dyage. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)


+ (instancetype)buttonWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font
{
    UIButton *btn = [self buttonWithTitle:title];
    btn.titleLabel.font = font;
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalImage:(NSString *)normalImage hilightImage:(NSString *)hilightImage
{
    UIButton *btn = [self buttonWithTitle:title font:font];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hilightImage] forState:UIControlStateHighlighted];
    
    return btn;
    
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    UIButton *btn = [self buttonWithTitle:title font:font];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor
{
    UIButton *btn = [self buttonWithTitle:title font:font];
    [btn setTitleColor:titleNormalColor forState:UIControlStateNormal];
    
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor titleHilightColor:(UIColor *)titleHilightColor
{
    UIButton *btn = [self buttonWithTitle:title font:font titleNormalColor:titleNormalColor];
    [btn setTitleColor:titleHilightColor forState:UIControlStateHighlighted];
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalBackgroundlImage:(NSString *)normalBackgroundImage hilightBackgroundImage:(NSString *)hilightBackgroundImage
{
    UIButton *btn = [self buttonWithTitle:title font:font titleNormalColor:titleColor];
    [btn setBackgroundImage:[UIImage imageNamed:normalBackgroundImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hilightBackgroundImage] forState:UIControlStateHighlighted];
    return btn;
}


+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalBackgroundImage:(NSString *)normalBackgroundImage selectedBackgroundImage:(NSString *)selectedBackgroundImage
{
    UIButton *btn = [self buttonWithTitle:title font:font titleNormalColor:titleColor];
    [btn setBackgroundImage:[UIImage imageNamed:normalBackgroundImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedBackgroundImage] forState:UIControlStateSelected];
    return btn;
}

@end
