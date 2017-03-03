//
//  YXLoginViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/16.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXLoginViewController.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaHandler.h"
#import "UMSocialWechatHandler.h"
#import "YXNewsPrefixHeader.pch"
#import "FourModulesViewController.h"
#import "YXRegisteriPhoneVC.h"//手机注册

@interface YXLoginViewController ()
{
    NSString * M_nickname;
    NSString * M_openid;
    NSString * M_portrait;
    NSString * M_unionid;
    NSString *uuid;
    /*绑定账号*/
    NSString * YHID;
    NSString * YHaction;
    NSString * YHuid;
    NSString * YHname;
    
}

@property (weak, nonatomic) IBOutlet UITextField *iPhoneText;
@property (weak, nonatomic) IBOutlet UITextField *PasswordText;

@end

@implementation YXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    uuid = [UUID getUUDI];
    NSLog(@"uuid---%@",uuid);
    
}

//登录
- (IBAction)LoginClick:(UIButton *)sender {
    
    [self MobilePhoneRegister];
}


//手机注册
- (IBAction)iPhoneClick:(UIButton *)sender {
    
    YXRegisteriPhoneVC *iPhone = [[YXRegisteriPhoneVC alloc]init];
    [self.navigationController pushViewController:iPhone animated:YES];
}

//QQ登录
- (IBAction)QQLoginClick:(UIButton *)sender {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            NSString * url = @"http://test-newsapi.yxlady.com/v2/user/third_login";
            NSDictionary *paramater = @{@"action":@"qq",@"id":resp.uid,@"nickname":resp.name,@"openid":uuid,@"portrait":resp.iconurl};
            
            AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
            sess.requestSerializer = [AFHTTPRequestSerializer serializer];
            sess.responseSerializer = [AFHTTPResponseSerializer serializer];
            [sess POST:url parameters:paramater progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSLog(@"qq登录成功-----%@",dic);
                
                if ([dic[@"error"]intValue] == -2) {
                    
                    YHID = dic[@"list"][@"id"];
                    YHname = dic[@"list"][@"nickname"];
                    YHuid = resp.uid;
                    YHaction = @"qq";
                    NSString * informStr = [NSString stringWithFormat:@"您以用该手机注册,用户名称“%@”的账号,是否于该账号绑定",YHname];
                    
                    [self BAAlertWithTitle:informStr message:nil andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
                        if (index == 0) {
                            return ;
                        }
                        if (index == 1) {
                            [self thirdPartyMerge];
                        }
                        
                    }];
                }
                
                if ([dic[@"error"]intValue] == 0) {
                    
                    YXDataUser * urserData = [[YXDataUser alloc]init];
                    if ([urserData parse:dic[@"data"]]) {
                        
                        if ([urserData loginToUser]) {
                            
                            [self.navigationController popToRootViewControllerAnimated:YES];
                            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                            [center postNotificationName:@"loadGlobalView" object:nil];
                        }
                        
                    }
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                NSLog(@"登录失败 ----- %@",error);
            }];
        }
    }];
}

//微信
- (IBAction)WeChatClick:(UIButton *)sender {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            NSLog(@"error----%@",error);
            
        } else {
            
            UMSocialUserInfoResponse *resp = result;
            
            NSString * url = @"http://test-newsapi.yxlady.com/v2/user/third_login";
            NSDictionary *paramater = @{@"action":@"wechat",@"id":resp.uid,@"nickname":resp.name,@"openid":uuid,@"portrait":resp.iconurl,@"unionid":resp.uid};
            
            AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
            sess.requestSerializer = [AFHTTPRequestSerializer serializer];
            sess.responseSerializer = [AFHTTPResponseSerializer serializer];
            [sess POST:url parameters:paramater progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSLog(@"dic ----- %@",dic);
                
                if ([dic[@"error"]intValue] == 0) {
                    
                    YXDataUser * urserData = [[YXDataUser alloc]init];
                    if ([urserData parse:dic[@"data"]]) {
                        
                        if ([urserData loginToUser]) {
                            
                            [self showAlert:dic[@"msg"]];
                            [self.navigationController popViewControllerAnimated:YES];
                            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                            [center postNotificationName:@"loadGlobalView" object:nil];
                            
                        }
                    }
                }
                if ([dic[@"error"]intValue] == -2) {
                    
                    YHID = dic[@"list"][@"id"];
                    YHname = dic[@"list"][@"nickname"];
                    YHuid = resp.uid;
                    YHaction = @"wechat";
                    NSString * informStr = [NSString stringWithFormat:@"您以用该手机注册,用户名称“%@”的账号,是否于该账号绑定",YHname];
                    
                    [self BAAlertWithTitle:informStr message:nil andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
                        if (index == 0) {
                            return ;
                        }
                        if (index == 1) {
                            [self thirdPartyMerge];
                        }
                        
                    }];
                }
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                NSLog(@"登录失败 ---- %@",error);
                
            }];
        }
    }];
}

//微博
- (IBAction)weiboClick:(UIButton *)sender {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            NSLog(@"error----%@",error);
            
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            NSString * url = @"http://test-newsapi.yxlady.com/v2/user/third_login";
            NSDictionary *paramater = @{@"action":@"blog",@"id":resp.uid,@"nickname":resp.name,@"openid":uuid,@"portrait":resp.iconurl};
            
            AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
            sess.requestSerializer = [AFHTTPRequestSerializer serializer];
            sess.responseSerializer = [AFHTTPResponseSerializer serializer];
            [sess POST:url parameters:paramater progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                
                if ([dic[@"error"]intValue] == 0) {
                    
                    YXDataUser * urserData = [[YXDataUser alloc]init];
                    if ([urserData parse:dic[@"data"]]) {
                        
                        if ([urserData loginToUser]) {
                            
                            [self showAlert:dic[@"msg"]];
                            [self.navigationController popViewControllerAnimated:YES];
                            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                            [center postNotificationName:@"loadGlobalView" object:nil];
                            
                        }
                    }

                }
                if ([dic[@"error"]intValue] == -2) {
                    
                    YHID = dic[@"list"][@"id"];
                    YHname = dic[@"list"][@"nickname"];
                    YHuid = resp.uid;
                    YHaction = @"blog";
                    NSString * informStr = [NSString stringWithFormat:@"您以用该手机注册,用户名称“%@”的账号,是否于该账号绑定",YHname];
                    
                    [self BAAlertWithTitle:informStr message:nil andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
                        if (index == 0) {
                            return ;
                        }
                        if (index == 1) {
                            [self thirdPartyMerge];
                        }
                        
                    }];
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
    }];
}

#pragma mark -- 手机登录

//注册手机
-(void)MobilePhoneRegister
{
    
    NSDictionary *registerdic = @{@"phone":self.iPhoneText.text,@"password":self.PasswordText.text,@"openid":uuid};
    NSString *registerURL = @"http://test-newsapi.yxlady.com/v2/user/common_login";
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess POST:registerURL parameters:registerdic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"dic ---- %@",dic);
        if ([dic[@"error"]intValue] == 0) {
            
            [self showAlert:dic[@"msg"]];
            
            YXDataUser * urserData = [[YXDataUser alloc]init];
            if ([urserData parse:dic[@"data"]]) {
                
                if ([urserData loginToUser]) {
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                    [center postNotificationName:@"loadGlobalView" object:nil];
                    
                }
            }
            
        }else{
            
            [self showAlert:dic[@"msg"]];
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}


#pragma mark -- 第一次第三方账号登录 （绑定其账号）

-(void)thirdPartyMerge{
    
    NSDictionary * thirdDic = @{@"userid":YHID,@"openid":uuid,@"action":YHaction,@"id":YHuid};
    
    NSString *thirdURL = @"http://test-newsapi.yxlady.com/v2/user/bind_user";
    
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    [sess POST:thirdURL parameters:thirdDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([dic[@"error"]intValue] == 0) {
            
            [self showAlert:dic[@"msg"]];
            
            YXDataUser * urserData = [[YXDataUser alloc]init];
            if ([urserData parse:dic[@"data"]]) {
                
                if ([urserData loginToUser]) {
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                    [center postNotificationName:@"loadGlobalView" object:nil];
                    
                }
            }
            
        }else{
            
            [self showAlert:dic[@"msg"]];
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}











@end
