//
//  YX_CommentModel.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/3/1.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YX_CommentModel.h"
#import "YX_intrectChildListModel.h"
@implementation YX_CommentModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"list":[YX_intrectChildListModel class]};
}


@end
