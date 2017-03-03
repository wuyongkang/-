//
//  YX_InteractModel.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 16/12/21.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YX_InteractModel.h"
#import "YX_IntrectZTModel.h"
@implementation YX_InteractModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"data":[YX_IntrectZTModel class]
             };
    
}
@end
