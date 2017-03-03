//
//  YXRuleWeb.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/9.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXRuleWeb.h"

@interface YXRuleWeb ()

@end

@implementation YXRuleWeb

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lodaWebView];
}



-(void)lodaWebView{
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"积分规则";
    
    webview = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://zhuanqian-api.yxlady.com/notify/notice"]];
    [webview loadRequest:request];
    [self.view addSubview: webview];
    

    
}




@end
