//
//  UITextField+Extension.m
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)


+ (instancetype)textFieldWithText:(NSString *)text
{
    UITextField *tf = [[self alloc] init];
    tf.text = text;
    
    return tf;
}


+ (instancetype)textFieldWithText:(NSString *)text placeholder:(NSString *)placeholder
{
    UITextField *tf = [self textFieldWithText:text];
    tf.placeholder = placeholder;
    
    return tf;
}


+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
{
    UITextField *tf = [[self alloc] init];
    tf.placeholder = placeholder;
    
    return tf;
}


+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder];
    tf.font = font;
    
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font clearButtonMode:(UITextFieldViewMode)clearButtonMode
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font];
    tf.clearButtonMode = clearButtonMode;
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font];
    tf.textColor = textColor;
    
   
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor delegate:(id <UITextFieldDelegate>)delegate
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font textColor:textColor];
    tf.delegate = delegate;
    
    
    return tf;
}


+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder leftView:(UIView *)leftView
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder];
    tf.leftView = leftView;
    tf.leftViewMode = UITextFieldViewModeAlways;
    return tf;
}


+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder leftView:leftView];
    tf.rightView = rightView;
    tf.rightViewMode = UITextFieldViewModeAlways;
    return tf;
}


+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font textColor:textColor];
    tf.leftView = leftView;
    tf.leftViewMode = UITextFieldViewModeAlways;
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView delegate:(id <UITextFieldDelegate>)delegate
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font textColor:textColor leftView:leftView];
    tf.delegate = delegate;
    
    return tf;
}


+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView rightView:(UIView *)rightView
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font textColor:textColor leftView:leftView];
    tf.rightView = rightView;
    tf.rightViewMode = UITextFieldViewModeAlways;
    return tf;
}

+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder font:(UIFont *)font textColor:(UIColor *)textColor leftView:(UIView *)leftView rightView:(UIView *)rightView delegate:(id <UITextFieldDelegate>)delegate
{
    UITextField *tf = [self textFieldWithPlaceholder:placeholder font:font textColor:textColor leftView:leftView rightView:rightView];
    tf.delegate = delegate;
    
    return tf;
}

@end
