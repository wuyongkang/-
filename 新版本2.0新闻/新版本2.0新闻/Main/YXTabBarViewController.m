//
//  YXTabBarViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/12.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXTabBarViewController.h"
#import "YxNavigationVC.h"

@interface YXTabBarViewController ()<UITabBarDelegate,UITabBarControllerDelegate>
{
    OneModulesViewController * oneNC;
    TwoModulesViewController * twoNC;
    ThreeModulesViewController *threeNC;
    FourModulesViewController *fourNC;
    
    YxNavigationVC * oneNV;
    YxNavigationVC * twoNV;
    YxNavigationVC * threeNV;
    YxNavigationVC * fourNV;
    
}

@end

@implementation YXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    oneNC = [[OneModulesViewController alloc]init];
    twoNC = [[TwoModulesViewController alloc]init];
    threeNC = [[ThreeModulesViewController alloc]init];
    fourNC = [[FourModulesViewController alloc]init];
    
    self.TBC= [[UITabBarController alloc]init];
    _TBC.delegate = self;
    
    [self setUpAllChildViewController];
    
}

- (void)setUpAllChildViewController{
    
    //控制器1
    UIImage *oneimage = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedone = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:oneimage selectedImage:selectedone];
    
    //控制器2
    UIImage *twoimage = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedtwo = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:twoimage selectedImage:selectedtwo];
    
    //控制器1
    UIImage *threeimage = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedthree = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:threeimage selectedImage:selectedthree];
    
    //控制器1
    UIImage *fourimage = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedfour = [[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:fourimage selectedImage:selectedfour];
    
    oneNC.title = @"精选";
    twoNC.title = @"热点";
    threeNC.title = @"互动";
    fourNC.title = @"我的";
    
    oneNV = [[YxNavigationVC alloc]initWithRootViewController:oneNC];
    twoNV = [[YxNavigationVC alloc]initWithRootViewController:twoNC];
    threeNV = [[YxNavigationVC alloc]initWithRootViewController:threeNC];
    fourNV = [[YxNavigationVC alloc]initWithRootViewController:fourNC];
    
    _TBC.viewControllers = @[oneNV,twoNV,threeNV,fourNV ];
    _TBC.tabBar.barTintColor = [UIColor whiteColor];
    self.window.rootViewController = _TBC;
    [self.window makeKeyAndVisible];
    
}

@end
