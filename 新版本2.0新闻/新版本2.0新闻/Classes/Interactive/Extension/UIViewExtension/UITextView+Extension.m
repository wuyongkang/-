//
//  UITextView+Extension.m
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import "UITextView+Extension.h"

@implementation UITextView (Extension)

/**
 *  @param text 文本
 */
+ (instancetype)textViewWithText:(NSString *)text
{
    UITextView *tv = [[self alloc] init];
    tv.text = text;
    return tv;
}
/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 */
+ (instancetype)textViewWithFont:(UIFont *)font
{
    UITextView *tv = [[self alloc] init];
    tv.font = font;
    return tv;
}
/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 */
+ (instancetype)textViewWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor
{
    UITextView *tv = [self textViewWithText:text];
    tv.font = font;
    tv.textColor = textColor;
    return tv;
}

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param textAlignment 文本对齐方式
 */
+ (instancetype)textViewWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment
{
    UITextView *tv = [self textViewWithText:text font:font textColor:textColor];
    tv.textAlignment = textAlignment;
    return tv;
}

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param delegate 代理
 */
+ (instancetype)textViewWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor delegate:(id <UITextViewDelegate>)delegate
{
    UITextView *tv = [self textViewWithText:text font:font textColor:textColor];
    tv.delegate = delegate;
    return tv;
}

@end
