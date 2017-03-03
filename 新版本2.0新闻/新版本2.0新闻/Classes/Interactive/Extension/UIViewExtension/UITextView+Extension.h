//
//  UITextView+Extension.h
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Extension)
/**
 *  @param text 文本
 */
+ (instancetype)textViewWithText:(NSString *)text;
/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 */
+ (instancetype)textViewWithFont:(UIFont *)font;
/**
 *  @param text 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 */
+ (instancetype)textViewWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

/**
 *  @param text 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param textAlignment 文本对齐方式
 */
+ (instancetype)textViewWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

/**
 *  @param text 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param delegate 代理
 */
+ (instancetype)textViewWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor delegate:(id <UITextViewDelegate>)delegate;
@end
