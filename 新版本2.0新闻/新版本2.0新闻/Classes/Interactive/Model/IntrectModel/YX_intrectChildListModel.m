//
//  YX_intrectChildListModel.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_intrectChildListModel.h"
#import "YX_IntrectCommentChildModel.h"
@implementation YX_intrectChildListModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"child":[YX_IntrectCommentChildModel class]};
}

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
