//
//  YXNetWork.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/2.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXNetWork.h"
#import <AFNetworking.h>

@implementation YXNetWork

- (void) postNetWorkData:(NSDictionary *)dictionary
           url:(NSString *)url
            success:(void (^)(id data, NSError *error))successBlock
              error:(void (^)(id data, NSError *error))errorBlock
{
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess POST:url parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        successBlock(dict,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        errorBlock(task,error);
        
    }];

}

- (void) getNetWorkData:(NSDictionary *)dictionary
                     url:(NSString *)url
                 success:(void (^)(id data, NSError *error))successBlock
                   error:(void (^)(id data, NSError *error))errorBlock
{
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess GET:url parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        successBlock(dic,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        errorBlock(task,error);
    }];
    
    
}



@end
