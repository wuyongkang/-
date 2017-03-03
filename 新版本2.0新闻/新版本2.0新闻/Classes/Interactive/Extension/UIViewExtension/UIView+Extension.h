//
//  UIView+Extension.h
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  分割线，alpha = 0.1， 黑色，
 */
+ (instancetype)seperator;

/**
 *  容器，可用于tableView header,footerView最外层的包装
 *
 *  @param height 容器高度
 */
+ (instancetype)containerWithHeight:(CGFloat)height;


/**
 *  圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;

/**
 *  边框宽，边框颜色
 */
- (void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


/**
 *  边框宽，边框颜色，圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
