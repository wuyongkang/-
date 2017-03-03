//
//  UIBarButtonItem+Extension.m
//  Eric微博
//
//  Created by Eric`Ｗ on 15/12/11.
//  Copyright © 2015年 Eric`Ｗ. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
     UIButton *button = [[UIButton alloc] init];
     [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
     [button setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
     
     // 设置按钮的尺寸为背景图片的尺寸
//     button.size = button.currentBackgroundImage.size;
    
    [button sizeToFit];
    
     // 监听按钮点击
     [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
     return [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (UIBarButtonItem *)itemWithTitle:(NSString *)title Color:(UIColor *)color State:(UIControlState)state target:(id)target action:(SEL)action
{
     UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
     [button setTitle:title forState:state];
     [button setTitleColor:color forState:UIControlStateDisabled];
     button.titleLabel.font = [UIFont systemFontOfSize:16];
     button.frame = CGRectMake(0, 0, 40, 20);
     /**监听点击*/
     [button addTarget:self action:@selector(action)
      forControlEvents:UIControlEventTouchUpInside];
//     UIBarButtonItem *menuButton =

     return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
