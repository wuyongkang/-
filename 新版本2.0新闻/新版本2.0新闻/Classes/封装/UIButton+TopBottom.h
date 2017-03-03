//
//  UIButton+TopBottom.h
//  Water
//
//  Created by boom on 16/8/19.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TopBottom)

/**
 *  上图片下文字
 *
 *  @param spacing <#spacing description#>
 */
- (void)verticalImageAndTitle:(CGFloat)spacing;

/**
 *  左文字 右图片
 */
- (void)rightImageLeftTitle;

@end
