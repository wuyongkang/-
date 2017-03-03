//
//  YX_IntrectCommentModel.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentModel.h"

@implementation YX_IntrectCommentModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}


- (NSString *)create_time
{
    NSDate *created = [NSDate dateWithTimeIntervalSince1970:[_create_time integerValue]];
    
    NSDateFormatter *fmat = [[NSDateFormatter alloc] init];
    fmat.dateFormat = @"MM-dd HH:MM";
    
    NSString *dateString= [fmat stringFromDate:created];
    

    return dateString;
}
@end
