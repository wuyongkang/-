//
//  NSObject+BAProgressHUD.h
//  BABaseProject
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface NSObject (BAProgressHUD)

/** 弹出文字提示 */
- (void)showAlert:(NSString *)text;

/** 弹出文字提示，自定义显示时间 */
- (void)showAlert:(NSString *)text withTime:(int)time;

/** 显示忙 */
//- (void)showBusy;

/*!
 *  进度条提示
 *
 *  @param text 提示内容
 */
-(void)showProgress:(NSString *)text;

/** 隐藏提示 */
- (void)hideProgress;




@end
