//
//  YXGenderController.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/21.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXGenderController.h"
#import "MainTabBarController.h"
#import "YXGuideModel.h"
#import "YX_BaseModel.h"
#import "YX_HomeChannelModel.h"
@interface YXGenderController ()

@property (weak, nonatomic) IBOutlet UIButton *menBtn;
@property (weak, nonatomic) IBOutlet UIButton *womenBtn;

// 栏目
@property (nonatomic,strong) NSMutableString *channelString;
// 性别
@property (nonatomic,strong) NSString *gender;

@end

@implementation YXGenderController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)menBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.menBtn = sender;
    self.womenBtn.selected = NO;
    self.gender = @"男";
}

- (IBAction)womenBtnClick:(UIButton *)sender
{
    
    sender.selected = !sender.selected;
    
    self.womenBtn = sender;
    self.menBtn.selected = NO;
    self.gender = @"女";
}


- (IBAction)startBtnClick:(id)sender
{
    if (!self.menBtn.selected && !self.womenBtn.selected) {
        return;
    }
    [self.channelString appendString:self.gender];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"tags"] = self.channelString;
    [self showAlert:@"正在加载"];
    [[YXNetworkTool shareNetworkTool] POST:@"subscribe/boot" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        YX_HomeChannelModel *model = [YX_HomeChannelModel mj_objectWithKeyValues:responseObject];
        if (model.error == 0) {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            MainTabBarController *vc  = [[MainTabBarController alloc]init];
            vc.homeUrl = model.homeUrl;
            window.rootViewController = vc;
        }else{
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            MainTabBarController *vc  = [[MainTabBarController alloc]init];
          
            window.rootViewController = vc;
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        MainTabBarController *vc  = [[MainTabBarController alloc]init];
        
        window.rootViewController = vc;
        
    }];
    

   
}

- (void)setArray:(NSMutableArray *)array
{
    _array = array;
    
    NSMutableString *string = [NSMutableString string];
    
    for (YXGuideModel *model in array) {
        if (model.isSelect) {
            [string appendFormat:@"%@,",model.title];
            
        }
       
    }
    self.channelString = string;
}
@end
