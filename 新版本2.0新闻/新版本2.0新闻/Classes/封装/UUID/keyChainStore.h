//
//  keyChainStore.h
//  xixi
//
//  Created by 李元喜 on 16/4/27.
//  Copyright © 2016年 李元喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface keyChainStore : NSObject


+(void)save:(NSString *)service data:(id)data;
+(id)load:(NSString *)service;
+(void)dedlteKetData:(NSString *)service;


@end
