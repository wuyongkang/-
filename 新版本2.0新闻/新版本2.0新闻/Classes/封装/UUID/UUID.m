//
//  UUID.m
//  xixi
//
//  Created by 李元喜 on 16/4/27.
//  Copyright © 2016年 李元喜. All rights reserved.
//

#import "UUID.h"
#import "keyChainStore.h"
@implementation UUID

#define KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"

+(NSString*)getUUDI{

    NSString *strUUID = (NSString *)[keyChainStore load:@"com.company.app.usernamepassword"];
    if ([strUUID isEqualToString:@""]||!strUUID) {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidRef));
        
        [keyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
        
        
    }


    return strUUID;
}


@end
