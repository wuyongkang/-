//
//  YxNavigationVC.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/12.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YxNavigationVC.h"
#import "UIView+AICategory.h"

@interface YxNavigationVC ()

@end

@implementation YxNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    //    UIImage *bg = [UIImage imageNamed:@"NavImage"];
    //
    UINavigationBar *bar = [UINavigationBar appearance];
    //    //    [bar setTintColor:[UIColor blackColor]];
    //    [bar setBackgroundImage:bg forBarMetrics:UIBarMetricsDefault];
    
    [bar setBarTintColor:YX_RGBColor(32, 210, 255)];
    
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
}
/**
 *  拦截所有控制器的push控制器
 *
 *  @param viewController 即将到来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //自动隐藏tabbar
        [viewController setHidesBottomBarWhenPushed:YES];
        viewController.navigationController.navigationBar.tintColor = [UIColor redColor];

        /**
         *  设置barButton
         */
     
        viewController.navigationItem.leftBarButtonItem = [self itemWithTarget:self action:@selector(back) image:@"NavigationBar_Back" highImage:@"NavigationBar_Back"];
        self.navigationController.navigationBar.titleTextAttributes =@{UITextAttributeTextColor: [UIColor whiteColor],UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};

        //
        //        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}


- (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    /**
     *  设置返回barButton
     */
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
