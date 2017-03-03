//
//  UIBarButtonItem+Extension.h
//  Eric微博
//
//  Created by Eric`Ｗ on 15/12/11.
//  Copyright © 2015年 Eric`Ｗ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;

- (UIBarButtonItem *)itemWithTitle:(NSString *)title Color:(UIColor *)color State:(UIControlState)state target:(id)target action:(SEL)action;;
@end
