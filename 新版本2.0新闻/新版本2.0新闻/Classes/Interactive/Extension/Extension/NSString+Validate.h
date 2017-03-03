//
//  NSString+Validate.h
//  WellRead
//
//  Created by bevis on 15/12/21.
//  Copyright © 2015年 dyage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)
//邮箱
- (BOOL)validateEmail;

//手机号码验证
- (BOOL)validateMobile;

//车牌号验证
- (BOOL)validateCarNo;

//车型
- (BOOL)validateCarType;

//用户名
- (BOOL)validateUserName;

//真实姓名
- (BOOL)validateTrueName;

//密码
- (BOOL)validatePassword;

//昵称
- (BOOL)validateNickname;

//身份证号
- (BOOL)validateIdentityCard;

//字符长度范围
- (BOOL)validateStringMinLength:(NSInteger)minLength maxLength:(NSInteger)maxLength;

@end
