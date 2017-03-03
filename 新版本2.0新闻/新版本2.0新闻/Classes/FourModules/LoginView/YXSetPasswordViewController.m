//
//  YXSetPasswordViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/18.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXSetPasswordViewController.h"
#import "YXSetMaterialViewController.h"

@interface YXSetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SetNameText;
@property (weak, nonatomic) IBOutlet UITextField *SetPasswordText;
@property (weak, nonatomic) IBOutlet UITextField *AffirmPasswordText;

@end

@implementation YXSetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置用户密码";
}

//下一步
- (IBAction)UpButtonClick:(UIButton *)sender {
    
    if (self.SetPasswordText.text.length == 0 || self.AffirmPasswordText.text.length == 0 || self.SetNameText.text.length == 0) {
        
        [self showAlert:@"质料不能为空"];
        return;
    }
    
    if (self.SetPasswordText.text == self.AffirmPasswordText.text) {
        
        YXSetMaterialViewController * mater = [[YXSetMaterialViewController alloc]init];
        mater.Phone = self.iphone;
        mater.Password = self.SetPasswordText.text;
        mater.NickName = self.SetNameText.text;
        [self.navigationController pushViewController:mater animated:YES];
        
    }else{
        
        [self showAlert:@"两次输入的密码不相同"];
    }
}
@end
