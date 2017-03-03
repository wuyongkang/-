//
//  YXNewbieTaskViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/9.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXNewbieTaskViewController.h"
#import "YXBindingiPhone.h"
@interface YXNewbieTaskViewController ()

@end

@implementation YXNewbieTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.title = @"新手任务";
}

- (IBAction)BindingiPhone:(UIButton *)sender {
    
    YXBindingiPhone * iphone = [[YXBindingiPhone alloc]init];
    [self.navigationController pushViewController:iphone animated:YES];
    
}

- (IBAction)BindingWX:(UIButton *)sender {
}

- (IBAction)BindingQQ:(UIButton *)sender {
}

- (IBAction)BindingWB:(UIButton *)sender {
}




















@end
