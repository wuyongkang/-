//
//  ProgressQueue.m
//  yrapp
//
//  Created by xbill on 16/4/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "ProgressQueue.h"

@implementation ProgressQueue

static ProgressQueue * g_pQueue = nil;

+(instancetype)shareProgressQueue
{
    if(g_pQueue == nil)
    {
        g_pQueue = [[ProgressQueue alloc] init];
    }
    return g_pQueue;
}

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        m_hubArray = [[NSMutableArray alloc] init];
    }
    return self;
}


/*!
 *  添加一个显示
 *
 *  @param hub 显示对象
 */
-(void)addShowHUD:(MBProgressHUD *)hub
{
    [self hideAllHub];
    [m_hubArray addObject:hub];
}

-(void)hideAllHub
{
    for (MBProgressHUD * hub in m_hubArray) {
        [hub hide:YES];
    }
}


/*!
 *  移除一个显示
 */
-(void)removeShowHUD
{
    //移除最前面的一个
    if([m_hubArray count]>0)
    {
        MBProgressHUD * hudView = [m_hubArray objectAtIndex:0];
        if([hudView isMemberOfClass:[MBProgressHUD class]])
        {
            [hudView hide:YES];
            [hudView removeFromSuperview];
            hudView = nil;
        }
        [m_hubArray removeObjectAtIndex:0];
    }
}


/*!
 *  移除所有的显示界面
 */
-(void)removeAllHUD
{
    for (MBProgressHUD * hudView in m_hubArray) {
        if([hudView isMemberOfClass:[MBProgressHUD class]])
        {
            [hudView hide:YES];
            [hudView removeFromSuperview];
        }
    }
    
    [m_hubArray removeAllObjects];
}
@end
