//
//  UITextField+Extension.h
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)
/**
 *  @param text 文本
 */
+ (instancetype)textFieldWithText:(NSString *)text;
/**
 *  @param text 文本
 *  @param placeholder 占位文本
 */
+ (instancetype)textFieldWithText:(NSString *)text placeholder:(NSString *)placeholder;
/**
 *  @param placeholder 占位文本
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder;
/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font;

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param clearButtonMode 清除按钮样式
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font clearButtonMode:(UITextFieldViewMode)clearButtonMode;

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor;

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param delegate 代理
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor delegate:(id <UITextFieldDelegate>)delegate;

/**
 *  @param placeholder 占位文本
 *  @param leftView 左边的View
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder leftView:(UIView *)leftView;

/**
 *  @param placeholder 占位文本
 *  @param leftView 左边的View
 *  @param rightView 右边的View
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder leftView:(UIView *)leftView rightView:(UIView *)rightView;

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param leftView 左边的View
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView;


/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param leftView 左边的View
 *  @param delegate 代理
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView delegate:(id <UITextFieldDelegate>)delegate;

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param leftView 左边的View
 *  @param rightView 右边的View
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView rightView:(UIView *)rightView;

/**
 *  @param placeholder 占位文本
 *  @param font 文本字体
 *  @param textColor 文本颜色
 *  @param leftView 左边的View
 *  @param rightView 右边的View
 *  @param delegate 代理
 */
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView rightView:(UIView *)rightView delegate:(id <UITextFieldDelegate>)delegate;

@end
