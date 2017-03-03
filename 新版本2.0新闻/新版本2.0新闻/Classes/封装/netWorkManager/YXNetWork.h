//
//  YXNetWork.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/2.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXNetWork : NSObject


- (void) postNetWorkData:(NSDictionary *)dictionary
                     url:(NSString *)url
                 success:(void (^)(id data, NSError *error))successBlock
                   error:(void (^)(id data, NSError *error))errorBlock;

- (void) getNetWorkData:(NSDictionary *)dictionary
                    url:(NSString *)url
                success:(void (^)(id data, NSError *error))successBlock
                  error:(void (^)(id data, NSError *error))errorBlock;

@end
