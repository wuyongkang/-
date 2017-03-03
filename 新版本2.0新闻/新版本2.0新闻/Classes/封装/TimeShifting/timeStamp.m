//
//  timeStamp.m
//  YXNews
//
//  Created by 李元喜 on 16/5/29.
//  Copyright © 2016年 李元喜. All rights reserved.
//

#import "timeStamp.h"

@implementation timeStamp

#pragma mark 时间戳转换【YYYY-MM-dd HH:mm】
+ (NSString *)getCurrentDateAndTimeWithTimeString:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[string intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

+ (NSString *)compareCurrentTime:(NSString *)str
{
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //发表（评论）时间
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str intValue]];
    NSString *startDate = [dateFormatter stringFromDate:confromTimesp];
    NSDate *sDate = [dateFormatter dateFromString:startDate];
    //当前时间
    NSData *date = [NSDate date];
    NSString *nowDate = [dateFormatter stringFromDate:date];
    NSDate *nDate = [dateFormatter dateFromString:nowDate];
    //计算时间间隔（单位是秒）
    NSTimeInterval time = [nDate timeIntervalSinceDate:sDate];
    //计算天数、时、分、秒
    int years = ((int)time)/(3600 * 24 *30 *12);
    int months = ((int)time)/(3600 * 24 *30);
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minutes = ((int)time)%(3600*24)%3600/60;
    int seconds = ((int)time)%(3600*24)%3600%60;
    NSString *timeStr;
    if (years > 0) {
        timeStr = [NSString stringWithFormat:@"%d 年前",years];
        return timeStr;
    }
    
    if (months > 0) {
        timeStr = [NSString stringWithFormat:@"%d 月前",months];
        return timeStr;
    }
    if (days > 0) {
        timeStr = [NSString stringWithFormat:@"%d 日前",days];
        return timeStr;
    }
    if (hours > 0) {
        timeStr = [NSString stringWithFormat:@"%d 小时前",hours];
        return timeStr;
    }
    if (minutes > 0) {
        timeStr = [NSString stringWithFormat:@"%d 分钟前",minutes];
        return timeStr;
    }
    if (seconds > 0) {
        timeStr = [NSString stringWithFormat:@"刚刚"];
        return timeStr;
    }
    
    return  timeStr;
}



@end
















