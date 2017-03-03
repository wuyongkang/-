//
//  YX_InteractEmptyView.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/15.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YX_InteractEmptyView.h"

@implementation YX_InteractEmptyView
+ (instancetype)InteractEmptyView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_InteractEmptyView" owner:nil options:nil]lastObject];
}

@end
