//
//  UIButton+Extension.h
//  WellRead
//
//  Created by bevis on 15/12/21.
//  Copyright © 2015年 dyage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
+ (instancetype)buttonWithTitle:(NSString *)title;

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font;


+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor;


+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleNormalColor:(UIColor *)titleNormalColor titleHilightColor:(UIColor *)titleHilightColor;


+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalImage:(NSString *)normalImage hilightImage:(NSString *)hilightImage;


+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;

+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalBackgroundlImage:(NSString *)normalBackgroundImage hilightBackgroundImage:(NSString *)hilightBackgroundImage;


+ (instancetype)buttonWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor normalBackgroundImage:(NSString *)normalBackgroundImage selectedBackgroundImage:(NSString *)selectedBackgroundImage;


@end
