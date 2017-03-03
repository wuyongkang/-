//
//  YXUser.h
//  YXTooHospital
//
//  Created by 李元喜 on 16/8/26.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#define  YXNewsUser [YXUser shareUser]
@interface YXUser : NSObject

@property (nonatomic, strong) NSString * m_id; //用户ID
@property (nonatomic, strong) NSString * m_phone;//用户手机号
@property (nonatomic, strong) NSString * m_nickname;//用户名称
@property (nonatomic, strong) NSString * m_sex;//用户性别（1男，2女）
@property (nonatomic, strong) NSString * m_age;//用户年龄
@property (nonatomic, strong) NSString * m_email;//用户邮箱
@property (nonatomic, strong) NSString * m_invitation_code;// 用户邀请码
@property (nonatomic, strong) NSString * m_bind_invitation_code;// 用户朋友邀请码
@property (nonatomic, strong) NSString * m_reg_time;// 注册时间
@property (nonatomic, strong) NSString * m_blog_id;// 微博ID
@property (nonatomic, strong) NSString * m_wechat_id;// 微信ID
@property (nonatomic, strong) NSString * m_qq_id;// QQ ID
@property (nonatomic, strong) NSString * m_open_id;//手机唯一标识
@property (nonatomic, strong) NSString * m_unionid;// 微信
@property (nonatomic, strong) NSString * m_portrait_url;// 头像
@property (nonatomic, strong) NSString * m_is_ban;//
@property (nonatomic, strong) NSString * m_is_vest;//

+(instancetype) shareUser;

//判断用户是否登录
-(BOOL)isLogin;
//退出
-(void)loginOut;



@end
