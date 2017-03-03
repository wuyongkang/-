//
//  timeStamp.h
//  YXNews
//
//  Created by 李元喜 on 16/5/29.
//  Copyright © 2016年 李元喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface timeStamp : NSObject
#pragma mark 时间戳转换【YYYY-MM-dd HH:mm】
+(NSString *)getCurrentDateAndTimeWithTimeString:(NSString *)string;


#pragma mark 多少分钟前
+(NSString *)compareCurrentTime:(NSString *)str;

@end
