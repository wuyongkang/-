//
//  YX_IntrectDetailModel.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectDetailModel.h"
#import "YX_IntrectDeatilHModel.h"
#import "YX_IntrectCommentModel.h"
@implementation YX_IntrectDetailModel
+ (NSDictionary *)mj_objectClassInArray
{
    return  @{
              @"detail":[YX_IntrectDeatilHModel class],
              @"comment":[YX_IntrectCommentModel class]
              };
}
@end
