//
//  ThreeModulesViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/12.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "ThreeModulesViewController.h"

@interface ThreeModulesViewController ()

@end

@implementation ThreeModulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIColor *testColor1= [UIColor colorWithRed:2/255.0 green:174/255.0 blue:236/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = testColor1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
