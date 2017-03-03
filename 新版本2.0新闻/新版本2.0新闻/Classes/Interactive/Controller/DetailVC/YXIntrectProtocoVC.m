//
//  YXIntrectProtocoVC.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/13.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXIntrectProtocoVC.h"
#import <WebKit/WebKit.h>
@interface YXIntrectProtocoVC ()
@property (nonatomic,strong) WKWebView *webView;
@end

@implementation YXIntrectProtocoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"积分协议";
    self.webView = [[WKWebView alloc] init];
    self.webView.frame = self.view.bounds;
    
    [self.view addSubview:self.webView];
    
    NSURL *path = [[NSBundle mainBundle]URLForResource:@"activity" withExtension:@"html"];
    
    //    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *URLRequest = [NSURLRequest requestWithURL:path];
    
    [self.webView loadRequest:URLRequest];
}



@end
