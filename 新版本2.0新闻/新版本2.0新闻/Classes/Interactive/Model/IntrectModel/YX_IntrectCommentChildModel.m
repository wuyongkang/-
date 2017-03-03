//
//  YX_IntrectCommentChildModel.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentChildModel.h"
#import "YX_intrectChildListModel.h"
@implementation YX_IntrectCommentChildModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"list":[YX_intrectChildListModel class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
@end
