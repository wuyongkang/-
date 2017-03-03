

//
//  YXRegisteriPhoneVC.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/17.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXRegisteriPhoneVC.h"
#import "YXTooltipView.h"
#import <CommonCrypto/CommonDigest.h>
#import "YXSetPasswordViewController.h"//下一步注册密码

@interface YXRegisteriPhoneVC ()
{
    NSString *timeString; //时间戳
    UIImage *timeImage;
}

@property (weak, nonatomic) IBOutlet UITextField *iPhoneText;
@property (weak, nonatomic) IBOutlet UITextField *yanzhengText;
@property (nonatomic, strong) UIView * mume;

@property (nonatomic, strong) YXTooltipView *tooltipview;

@end

@implementation YXRegisteriPhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册伊秀新闻通行证";
    self.tooltipview = [[YXTooltipView alloc]init];
    self.tooltipview.frame = CGRectMake(14,150, [UIScreen mainScreen].bounds.size.width-28, 210);
    self.tooltipview.layer.cornerRadius = 10;
    self.tooltipview.layer.masksToBounds = YES;
    self.iPhoneText.text = @"17620806836";
}

-(void)getimage{
    
    int y = (arc4random() % 100000) + 100000;
    NSURL *rul = [NSURL URLWithString:[NSString stringWithFormat:@"http://test-newsapi.yxlady.com/v2/captcha/img?t=%d",y]];
    NSData *data = [NSData dataWithContentsOfURL:rul];
    UIImage *image = [UIImage imageWithData:data];
    self.tooltipview.NumImage.image = image;
}

- (IBAction)GainbuttonClick:(UIButton *)sender {
    
    self.mume = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mume.backgroundColor = [UIColor blackColor];
    self.mume.alpha = 0.5;
    
    
    [self.tooltipview.ConfirmButton addTarget:self action:@selector(OKbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.tooltipview.CancelBUtton addTarget:self action:@selector(NoButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.tooltipview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.mume];
    [self.view addSubview: self.tooltipview];
    [self getimage];
}

//获取验证码
-(void)postData{
    
    NSDictionary *postdic = @{@"phone":self.iPhoneText.text,@"code":self.tooltipview.NumText.text};
    NSString *url1 = @"http://test-newsapi.yxlady.com/v2/captcha/send";
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess POST:url1 parameters:postdic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([dic[@"error"]intValue] == 0) {
            
            [self showAlert:dic[@"msg"]];
            [self.tooltipview removeFromSuperview];
            [self.mume removeFromSuperview];
            
        }else{
            
            [self showAlert:dic[@"msg"]];
            [self.tooltipview removeFromSuperview];
            [self.mume removeFromSuperview];
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

//图形验证码确定
-(void)OKbuttonClick{
    
    [self postData];
    
}

//图形验证码取消
-(void)NoButtonClick{
    
    [self.tooltipview removeFromSuperview];
    [self.mume removeFromSuperview];
}

//下一步
- (IBAction)NextStepClick:(UIButton *)sender
{
    YXSetPasswordViewController *Set = [[YXSetPasswordViewController alloc]init];
    Set.iphone = self.iPhoneText.text;
    [self.navigationController pushViewController:Set animated:YES];
}

//注册手机
-(void)RegisterPostData{
    
    NSDictionary *registerdic = @{@"phone":self.iPhoneText.text,@"code":self.yanzhengText.text};
    NSString *registerURL = @"http://test-newsapi.yxlady.com/v2/user/check_reg";
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess POST:registerURL parameters:registerdic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"dic ---- %@",dic);
        if ([dic[@"error"]intValue] == 0) {
            
            [self showAlert:dic[@"msg"]];
          
            
        }else{
            
            [self showAlert:dic[@"msg"]];
        
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
}





@end
