//
//  YXDataUser+saveUser.m
//  YXTooHospital
//
//  Created by 李元喜 on 16/8/29.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXDataUser+saveUser.h"
#import "YXUser.h"
@implementation YXDataUser (saveUser)

-(BOOL)loginToUser{
    if (self.dic == nil || ![self.dic isKindOfClass:[NSDictionary class]])return NO;
    
    YXUser *loginUser = [YXUser shareUser];
    loginUser.m_id = [self.dic objectForKey:@"id"];
    loginUser.m_phone = [self.dic objectForKey:@"phone"];
    loginUser.m_nickname = [self.dic objectForKey:@"nickname"];
    loginUser.m_sex = [self.dic objectForKey:@"sex"];
    loginUser.m_age = [self.dic objectForKey:@"age"];
    loginUser.m_email = [self.dic objectForKey:@"email"];
    loginUser.m_invitation_code = [self.dic objectForKey:@"invitation_code"];
    loginUser.m_bind_invitation_code = [self.dic objectForKey:@"bind_invitation_code"];
    loginUser.m_blog_id = [self.dic objectForKey:@"blog_id"];
    loginUser.m_wechat_id = [self.dic objectForKey:@"wechat_id"];
    loginUser.m_qq_id = [self.dic objectForKey:@"qq_id"];
    loginUser.m_open_id = [self.dic objectForKey:@"open_id"];
    loginUser.m_unionid = [self.dic objectForKey:@"unionid"];
    loginUser.m_portrait_url = [self.dic objectForKey:@"portrait_url"];
    
    return YES;
    
}





@end
