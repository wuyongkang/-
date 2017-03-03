//
//  YXSetMaterialViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/18.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXSetMaterialViewController.h"

@interface YXSetMaterialViewController ()
{
    NSString *uuid;
    /*已绑定用户信息*/
    NSString * YHname;
    NSString * YHID;
}
@property (weak, nonatomic) IBOutlet UIButton *Manbutton;
@property (weak, nonatomic) IBOutlet UIButton *womanButton;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *InvitationText;
@property (nonatomic, strong) NSString *sexNum;   //性别标号
@property (nonatomic, strong) UIButton *checkBtn;  //存放性别选中状态\

@end

@implementation YXSetMaterialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置个人质料";
    uuid = [UUID getUUDI];
}

#pragma mark - 性别单选实现
- (IBAction)sexChooseClick:(UIButton *)sender {
    self.sexNum = [NSString stringWithFormat:@"%d",(int)(sender.tag - 200)] ;
    NSLog(@"sexNUm --- %@",self.sexNum);
    
    UIButton *btn = nil;
    btn  = (UIButton *)[self.view viewWithTag:sender.tag];
    if ([btn isSelected]) {
        [btn setSelected:NO];
    }else{
        [btn setSelected:YES];
    }
    if (btn != self.checkBtn) {
        self.checkBtn.selected = NO;
        self.checkBtn = btn;
    }
    self.checkBtn.selected = YES;
}

//完成注册
- (IBAction)OkbuttonClick:(UIButton *)sender {
    
    if (self.sexNum.length == 0) {
        [self showAlert:@"请选择选择性别！"];
        return;
    }
    if (self.ageText.text.length == 0) {
        [self showAlert:@"年龄不能为空！"];
        return;
    }
    
    [self RegisterPostData];
}

//注册手机
-(void)RegisterPostData{
    
    NSDictionary *registerdic = @{@"phone":self.Phone,@"password":self.Password,@"nickname":self.NickName,@"openid":uuid,@"code":self.InvitationText.text,@"sex":self.sexNum,@"age":self.ageText.text};
    NSString *registerURL = @"http://test-newsapi.yxlady.com/v2/user/common_reg";
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess POST:registerURL parameters:registerdic progress:^(NSProgress * _Nonnull uploadProgress) {
        
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
            
            YHID = dic[@"data"][@"id"];
            YHname = dic[@"data"][@"nickname"];
            
            NSString * informStr = [NSString stringWithFormat:@"您以用该手机注册,用户名称“%@”的账号,是否于该账号绑定",YHname];
            
            [self BAAlertWithTitle:informStr message:nil andOthers:@[@"取消",@"确定"] animated:YES action:^(NSInteger index) {
                if (index == 0) {
                    return ;
                }
                if (index == 1) {
                    [self thirdPartyData];
                }
                
            }];
            
        }else{
            [self showAlert:dic[@"msg"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark  -- 手机号登录（绑定第三方账号）

-(void)thirdPartyData{
    
    NSDictionary * thirdDic = @{@"userid":YHID,@"openid":uuid,@"phone":self.Phone,@"password":self.Password};
    
    NSString *thirdURL = @"http://test-newsapi.yxlady.com/v2/user/bind_user";
    
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    [sess POST:thirdURL parameters:thirdDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([dic[@"error"]intValue] == 0) {
            
            YXDataUser * urserData = [[YXDataUser alloc]init];
            if ([urserData parse:dic[@"data"]]) {
                
                if ([urserData loginToUser]) {
                    
                    [self showAlert:dic[@"msg"]];
                    [self.navigationController popToRootViewControllerAnimated:YES];
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
