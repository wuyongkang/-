//
//  YXMacro.h
//  YXBluetooth
//
//  Created by Eric.Wu on 16/7/29.
//  Copyright © 2016年 YXLady. All rights reserved.
//

#ifndef YXMacro_h
#define YXMacro_h




#ifdef DEBUG //打开调试状态
#define YXLog(...) NSLog(__VA_ARGS__)


#else // 发布状态
#define YXLog(...)
#endif


#pragma mark - 常用常量
/** 屏幕的宽度 */
#define YX_ScreenWidth [UIScreen mainScreen].bounds.size.width

/** 屏幕的高度 */
#define YX_ScreenHeight [UIScreen mainScreen].bounds.size.height

//弱引用
#define YX_WS __weak __typeof(&*self)weakSelf = self;
#define YX_ErrorStatuses @"加载失败请检查网络设置"

//随机色
#define YX_RandomColor YX_RGBColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
//自定义RGB颜色
#define YX_RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//自定义RGBA颜色
#define YX_RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
/** 用户信息保存路径*/
#define YXAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

#define YXNameTextFont  15

#define YXTextFont 14

#define  YXMinTextFont 13

#define YXMargin 8


//判断手机型号
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define isIPhone4S (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define isIPhone5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define isIPhone6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define isIPhone6plus (IS_IPHONE && SCREEN_MAX_LENGTH >= 736.0)


#define APP_W   self.view.frame.size.width
#define APP_H   self.view.frame.size.height




#endif /* YXMacro_h */

