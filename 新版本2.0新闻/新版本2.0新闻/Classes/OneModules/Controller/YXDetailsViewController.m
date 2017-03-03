//
//  YXDetailsViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/6.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXDetailsViewController.h"
#import "ShareView.h"//分享
#import "YXTabbarView.h"

@interface YXDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIView *CustomBar;
@property (nonatomic, strong) NSMutableArray *tabImageArr;
@property (nonatomic, strong) YXTabbarView *tabbarview;
@end

@implementation YXDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"新闻详情";
    
    webview = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.detailsURL]];
    [webview loadRequest:request];
    [self.view addSubview: webview];
    
    
//    [self loadtableview];
//        [self customtabBar];
//    [self TabbarView];
}

-(void)loadtableview
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    self.tableView.tableHeaderView = self.headView;
    [self.view addSubview: self.tableView];
}



#pragma  -- 自定义 XIB
-(void)TabbarView
{
    self.tabbarview = [[YXTabbarView alloc]initWithFrame:CGRectMake(0, APP_H - 44, APP_W, 44)];
//    self.tabbarview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tabbarview];
    
}

#pragma mark --- 自定义tabBar
-(void)customtabBar
{
    self.tabImageArr = [NSMutableArray arrayWithObjects:@"tanmu",@"YS_food+",@"pinglun",@"YS_zan_sel",@"icon_back_top", nil];
    self.CustomBar = [[UIView alloc]initWithFrame:CGRectMake(0, APP_H - 44, APP_W, 44)];
    self.CustomBar.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.CustomBar];
    
    float w = (self.view.frame.size.width - 40 * 5) / 6;
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(w * (i + 1) + 40 * i , 5, 30, 30);
        [btn setBackgroundImage:[UIImage imageNamed:self.tabImageArr[i]] forState:UIControlStateNormal];
        [self.CustomBar addSubview:btn];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

-(void)btnClick:(UIButton *)button{
    
    if (button.tag == 100) {
        
        NSLog(@"弹幕");
    }
    
    if (button.tag == 101) {
        
        NSLog(@"发评论");
    }
    
    if (button.tag == 102) {
        
        NSLog(@"更多评论");
    }
    
    if (button.tag == 103) {
        
        NSLog(@"收藏");
    }
    
    if (button.tag == 104) {
        NSArray*imgNameArray=@[@"tabbar_compose_camera",@"tabbar_compose_friend",@"tabbar_compose_idea",@"tabbar_compose_music",@"tabbar_compose_photo",@"tabbar_compose_more"];
        
        NSArray * titleArray = @[@"相机",@"朋友",@"消息",@"音乐",@"相机",@"更多"];
        
        ShareView *animationView = [[ShareView alloc] initImageNameArray:imgNameArray withItmeTitleArray:titleArray];
        animationView.lineItmeNunber = 3;
        animationView.itmeSize = CGSizeMake(100, 100);
        animationView.itmeTitleFont = [UIFont systemFontOfSize:15];
        [animationView addButtonItmeToAnimationView];
        [animationView showAnimationView];
        animationView.yyAnimationButtonItmeClick = ^( NSInteger tags){
            
            if (tags == 0) {
                NSLog(@"相机");
            }
            if (tags == 1) {
                NSLog(@"朋友");
            }
            if (tags == 2) {
                NSLog(@"消息");
            }
            if (tags == 3) {
                NSLog(@"音乐");
            }
            if (tags == 4) {
                NSLog(@"相机");
            }
            if (tags == 5) {
                NSLog(@"更多");
            }
        };
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    cell.textLabel.text = @"小钢炮";
    
    return cell;
    
}








@end
