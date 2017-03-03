//
//  YXNetworkTool.h
//  YXFood
//
//  Created by Eric.Wu on 16/3/1.
//  Copyright © 2016年 yxlady. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface YXNetworkTool : AFHTTPSessionManager

+ (instancetype)shareNetworkTool;

+ (instancetype)shareNetworkToolPost;

+ (instancetype)GetShareNetworkTool;
@end
