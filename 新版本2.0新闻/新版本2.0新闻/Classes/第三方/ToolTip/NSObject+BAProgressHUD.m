//
//  NSObject+BAProgressHUD.m
//  BABaseProject
//
//  Created by apple on 16/1/14.
//

#import "NSObject+BAProgressHUD.h"
#import "ProgressQueue.h"

@implementation NSObject (BAProgressHUD)

/** 获取当前屏幕的最上方正在显示的那个view */
- (UIView *)getCurrentView
{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    // vc: 导航控制器, 标签控制器, 普通控制器
    if ([vc isKindOfClass:[UITabBarController class]])
    {
        vc = [(UITabBarController *)vc selectedViewController];
    }
    else if ([vc isKindOfClass:[UINavigationController class]])
    {
        vc = [(UINavigationController *)vc visibleViewController];
    }
    else
    {
//        AppDelegate *szApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        NSUInteger count = [szApp getCurrentTabViewController].navigationController.viewControllers.count;
//        if(count > 0)
//            vc = [szApp getCurrentTabViewController].navigationController.viewControllers[count -1];
    }
    
    return vc.view;
}

/** 弹出文字提示 */
- (void)showAlert:(NSString *)text
{
    // 防止在非主线程中调用此方法,会报错
//    [self showProgress:text];
    dispatch_async(dispatch_get_main_queue(), ^{
        // 弹出新的提示之前,先把旧的隐藏掉
//        [self hideProgress]; // 主线程中会先调用这个，所以速度很快
        [MBProgressHUD hideAllHUDsForView:[self getCurrentView] animated:YES];
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self getCurrentView] animated:YES];
        
        progressHUD.mode = MBProgressHUDModeText;
        progressHUD.labelText = text;
        [progressHUD hide:YES afterDelay:1.5];
    });
}

/** 弹出文字提示，自定义显示时间 */
- (void)showAlert:(NSString *)text withTime:(int)time
{
    // 防止在非主线程中调用此方法,会报错
    //    [self showProgress:text];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // 弹出新的提示之前,先把旧的隐藏掉
        //        [self hideProgress]; // 主线程中会先调用这个，所以速度很快
        [MBProgressHUD hideAllHUDsForView:[self getCurrentView] animated:YES];
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self getCurrentView] animated:YES];
        
        progressHUD.mode = MBProgressHUDModeText;
        progressHUD.labelText = text;
        [progressHUD hide:YES afterDelay:time];
    });
}

/*!
 *  进度条提示
 *
 *  @param text 提示内容
 */
-(void)showProgress:(NSString *)text
{
    [self performSelectorOnMainThread:@selector(_showProgress:) withObject:text waitUntilDone:YES];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//       
//        
////        // 弹出新的提示之前,先把旧的隐藏掉
////        // [self hideProgress]; // 主线程中会先调用这个，所以速度很快
////        [MBProgressHUD hideAllHUDsForView:[self getCurrentView] animated:YES];
////        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self getCurrentView] animated:YES];
////        
////        progressHUD.mode = MBProgressHUDModeIndeterminate;
////        progressHUD.labelText = text;
////        progressHUD.dimBackground = NO;
////        [progressHUD show:YES];
//    });
}

-(void)_showProgress:(NSString *)text
{
//    dispatch_async(dispatch_get_main_queue(), ^{
    
//    AppDelegate * szApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    NSUInteger count = [szApp getCurrentTabViewController].navigationController.viewControllers.count;
//    UIView * szView = [szApp getCurrentTabViewController].navigationController.viewControllers[count -1].view;
//    [MBProgressHUD hideAllHUDsForView:szView animated:YES];
    
        [self _hideProgress];
        
        UIView * szView = [self getCurrentView];
        MBProgressHUD * m_hud = [MBProgressHUD showHUDAddedTo:szView animated:YES];
        m_hud.labelText=text;
        m_hud.mode = MBProgressHUDModeIndeterminate;
        m_hud.dimBackground = NO;
        [m_hud show:YES];
        m_hud.tag = 153698;
        [szView bringSubviewToFront:m_hud];
        [PQUEUE addShowHUD:m_hud];
//    });
}

/** 显示忙 */
- (void)showBusy
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [MBProgressHUD hideAllHUDsForView:[self getCurrentView] animated:YES];
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self getCurrentView] animated:YES];
        
        // 最长显示30秒
        [progressHUD hide:YES afterDelay:30];
    }];
}

/** 隐藏提示 */
- (void)hideProgress
{
    [self performSelectorOnMainThread:@selector(_hideProgress) withObject:nil waitUntilDone:YES];
}

- (void)_hideProgress
{
//    dispatch_async(dispatch_get_main_queue(), ^{
        [PQUEUE removeShowHUD];
//    });
}

@end
