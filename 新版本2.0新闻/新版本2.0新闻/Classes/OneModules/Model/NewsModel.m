//
//  NewsModel.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/30.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.CELLID = value;
    }
}



@end
