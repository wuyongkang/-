//
//  YXSetNewsViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/19.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXSetNewsViewController.h"

@interface YXSetNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tabelview;
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray * imaArr;
@property (nonatomic, strong) UIView *footeriew;


@end

@implementation YXSetNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self loadSource];
    [self loadTableView];
    
}

-(void)loadSource
{
    self.titleArr = [NSMutableArray arrayWithObjects:@"设置个人资料",@"清除缓存",@"关于伊秀",@"版本号", nil];
    self.imaArr   = [NSMutableArray arrayWithObjects:@"applause_0",@"applause_1",@"applause_2",@"applause_3", nil];
    
}

-(void)loadTableView
{
    self.tabelview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tabelview.delegate = self;
    self.tabelview.dataSource = self;
    [self.tabelview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    [self.tabelview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self footerView];

    [self.view addSubview:self.tabelview];
    self.tabelview.tableFooterView = self.footeriew;
    
}

-(void)footerView{
    
    self.footeriew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    //    self.footeriew.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20, 20, self.view.frame.size.width-40, 40);
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button setTintColor:[UIColor whiteColor]];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds =YES;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(tuiChuButton) forControlEvents:UIControlEventTouchUpInside];
    [self.footeriew addSubview:button];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return  self.titleArr.count;
    }
    if (section == 1) {
        return 1;
    }
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = self.titleArr[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:self.imaArr[indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellEditingStyleNone;
    }
    if (indexPath.section == 1) {
        cell.textLabel.text = @"未定";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        cell.selectionStyle = UITableViewCellEditingStyleNone;
    }
    
    
    return cell;
}


#pragma mark-----退出
-(void)tuiChuButton{
    
    NSString *tuiURl = @"http://test-newsapi.yxlady.com/v2/user/logout";
    
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    [sess GET:tuiURl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSLog(@"dic----%@",dic);
        if ([dic[@"error"]intValue] == 0) {
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            //后注销后改变登录状态并存储到userDefaults
            [userDefaults setObject:@"0" forKey:@"isLogin"];
            [userDefaults synchronize];

            [self showAlert:dic[@"msg"]];
            [YXNewsUser loginOut];
            [self.navigationController popViewControllerAnimated:YES];
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            [center postNotificationName:@"loadGlobalView" object:nil];
            
        }else{
            
            [self showAlert:dic[@"msg"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
