//
//  AppDelegate.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/12.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "YXGuideViewController.h"
#import "YXNewsPrefixHeader.pch"
#import "MainTabBarController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "YXGuideController.h"
#define USHARE_DEMO_APPKEY @"5861e5daf5ade41326001eab"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow
                    alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[YXGuideController alloc]init];
    [self.window makeKeyAndVisible];
    
    
#pragma mark -  －－－－－－＊＊＊＊＊＊＊＊友盟SDK＊＊＊＊＊＊＊＊－－－－－－－－－－－
    
    /* 打开日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"587d947bf29d9866eb0017a4"];
    
    //设置QQ
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105177310"  appSecret:@"1JlgUS49zqwSYN7r" redirectURL:@"https://api.weibo.com/oauth2/default.html"];
    
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx3af7ff0c42efc7a4" appSecret:@"376b2738e23b32cba816ec018211e44f" redirectURL:@"https://api.weibo.com/oauth2/default.html"];
    
    //设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"721980574"appSecret:@"10c3ed0cfa99a9daa7cf0add91634906" redirectURL:@"https://api.weibo.com/oauth2/default.html"];

    
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
