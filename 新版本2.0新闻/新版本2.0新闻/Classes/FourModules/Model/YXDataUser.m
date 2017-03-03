//
//  YXDataUser.m
//  YXTooHospital
//
//  Created by 李元喜 on 16/8/26.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXDataUser.h"

@implementation YXDataUser
-(id)init
{
    self = [super init];
    if (self) {
        [self initParam];
    }
    return self;
}

-(void)initParam
{
    self.dic = nil;
}


-(BOOL)parse:(NSDictionary *)dicData
{
    if (dicData == nil || ![dicData isKindOfClass:[NSDictionary class]] ) {
        return NO;
    }
    [self initParam];
    self.dic = dicData;
    return YES;
}

@end
