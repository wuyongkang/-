//
//  YXDetailsViewController.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/6.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXDetailsViewController : UIViewController
{
    
    UIWebView *webview;
    
}

@property (nonatomic, strong) NSString *detailsURL;
@end
