//
//  YXDataUser.h
//  YXTooHospital
//
//  Created by 李元喜 on 16/8/26.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXDataUser : NSObject
@property (nonatomic, strong) NSDictionary *dic;
-(BOOL)parse:(NSDictionary *)dicData;

@end
