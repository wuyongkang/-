//
//  YXNetworkTool.m
//  YXFood
//
//  Created by Eric.Wu on 16/3/1.
//  Copyright © 2016年 yxlady. All rights reserved.
//

#import "YXNetworkTool.h"

@implementation YXNetworkTool

+ (instancetype)shareNetworkTool
{
    
    static YXNetworkTool *instance_;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance_ = [[self alloc] initWithBaseURL:[NSURL URLWithString:YX_Domain]];
        
        instance_.requestSerializer = [AFJSONRequestSerializer serializer];
//        [AFJSONResponseSerializer serializer].acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
    });
    
    return instance_;
    
}

+ (instancetype)GetShareNetworkTool
{
    
    static YXNetworkTool *instance_;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance_ = [[self alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        
        instance_.requestSerializer = [AFJSONRequestSerializer serializer];
        //        [AFJSONResponseSerializer serializer].acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
    });
    
    return instance_;
    
}
+ (instancetype)shareNetworkToolPost
{
    
    static YXNetworkTool *instance_;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance_ = [[self alloc] initWithBaseURL:[NSURL URLWithString:YX_Domain]];
        instance_.requestSerializer = [AFJSONRequestSerializer serializer];
        
    });
    
    return instance_;
    
}
@end
