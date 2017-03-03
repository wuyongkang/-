//
//  ProgressQueue.h
//  yrapp
//
//  Created by xbill on 16/4/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#define PQUEUE [ProgressQueue shareProgressQueue]

/*!
 *  进度条控制对列
 */
@interface ProgressQueue : NSObject
{
    NSMutableArray * m_hubArray;    //当前要显示的进度条的对象
    
    MBProgressHUD * m_addHub;
}

+(instancetype)shareProgressQueue;

/*!
 *  添加一个显示,必须在主线程里面执行
 *
 *  @param hub 显示对象
 */
-(void)addShowHUD:(MBProgressHUD *)hub;

/*!
 *  移除一个显示，必须在主线程里面执行
 */
-(void)removeShowHUD;

/*!
 *  移除所有的显示界面
 */
-(void)removeAllHUD;
@end
