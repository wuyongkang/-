//
//  MainTabBarController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/28.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "MainTabBarController.h"
#import "OneModulesViewController.h"
#import "TwoModulesViewController.h"
#import "ThreeModulesViewController.h"
#import "FourModulesViewController.h"
#import "MyTabBar.h"
#import "YxNavigationVC.h"
#import "YXInteractiveVC.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
  

    OneModulesViewController * oneVC = [[OneModulesViewController alloc]init];
    oneVC.title = @"首页";
    [self addChildVC:oneVC imageName:@"2shouye" selectedImageName:@"1shouye"];
    
//    TwoModulesViewController * twoVC = [[TwoModulesViewController alloc]init];
//    twoVC.title = @"热点";
//    [self addChildVC:twoVC imageName:@"YS_pro_nor" selectedImageName:@"YS_pro_sel"];
//    
    YXInteractiveVC * threeVC = [[YXInteractiveVC alloc]init];
    threeVC.title = @"互动";
    [self addChildVC:threeVC imageName:@"2huodong" selectedImageName:@"1huodong"];
    
    FourModulesViewController * fourVC = [[FourModulesViewController alloc]init];
    fourVC.title = @"我的";
    [self addChildVC:fourVC imageName:@"2wode" selectedImageName:@"1wode"];
    
    MyTabBar *myTabBar = [[MyTabBar alloc]init];
    [self setValue:myTabBar forKey:@"tabBar"];

}



- (void)addChildVC:(UIViewController *)childVc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = RGB(168, 168, 168);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = RGB(211,192,162);
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 添加为tabbar控制器的子控制器
    YxNavigationVC *nav = [[YxNavigationVC alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}

- (void)setHomeUrl:(NSURL *)homeUrl
{
    _homeUrl = homeUrl;
    
}

@end
