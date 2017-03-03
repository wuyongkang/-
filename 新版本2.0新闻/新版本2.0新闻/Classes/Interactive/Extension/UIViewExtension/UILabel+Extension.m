//
//  UILabel+Extension.m
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)


+ (instancetype)labelWithText:(NSString *)text
{
    UILabel *l = [[self alloc] init];
    l.text = text;
    
    return l;
}


+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font
{
    
    UILabel *l = [self labelWithText:text];
    l.font = font;
    return l;
}


+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor
{
    UILabel *l = [self labelWithText:text];
    l.textColor = textColor;
    return l;
}


+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *l = [self labelWithText:text textColor:textColor];
    l.font = font;
    return l;
}


+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *l = [self labelWithText:text textColor:textColor font:font];
    l.textAlignment = textAlignment;
    return l;
}

@end
