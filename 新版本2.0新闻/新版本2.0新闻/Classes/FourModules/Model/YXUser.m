//
//  YXUser.m
//  YXTooHospital
//
//  Created by 李元喜 on 16/8/26.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXUser.h"

@implementation YXUser

static YXUser *loginUser = nil;


+(instancetype)shareUser
{
    if (loginUser == nil) {
        loginUser = [[YXUser alloc]init];
        loginUser.m_id = nil;
        loginUser.m_phone =nil;
        loginUser.m_nickname= nil;
      
    }
    return loginUser;
}

//当前用户是否已登录
-(BOOL)isLogin
{
    if(_m_id == nil)
        return NO;
    else
        return YES;
}

//退出登录
-(void)loginOut
{
    self.m_id =nil;
    self.m_phone = nil;
    self.m_nickname = nil;
    self.m_sex = nil;
    self.m_age = nil;
    self.m_email = nil;
    self.m_invitation_code = nil;
    self.m_bind_invitation_code = nil;
    self.m_reg_time = nil;
    self.m_blog_id = nil;
    self.m_wechat_id = nil;
    self.m_qq_id = nil;
    self.m_open_id = nil;
    self.m_unionid = nil;
    self.m_portrait_url = nil;

}


@end
