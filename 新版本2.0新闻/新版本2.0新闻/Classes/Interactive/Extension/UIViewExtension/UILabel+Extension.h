//
//  UILabel+Extension.h
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
/**
 *  @param text 文本
 */
+ (instancetype)labelWithText:(NSString *)text;
/**
 *  @param text 文本
 *  @param font 文本字体
 */
+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor;
/**
 *  @param text 文本
 *  @param textColor 文本颜色
 */
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font;
/**
 *  @param text 文本
 *  @param textColor 文本颜色
 *  @param font 文本字体
 */
+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

/**
 *  @param text 文本
 *  @param textColor 文本颜色
 *  @param font 文本字体
 *  @param textAlignment 文本对齐方式
 */
+ (instancetype)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;
@end
