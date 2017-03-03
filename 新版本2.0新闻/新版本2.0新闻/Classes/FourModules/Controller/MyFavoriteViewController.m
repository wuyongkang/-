//
//  MyFavoriteViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/23.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "MyFavoriteViewController.h"

@interface MyFavoriteViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *tableArray;

@end

@implementation MyFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];    

    [self loadtableview];
    self.title = @"收藏";
}

-(void)loadtableview
{
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    [self.view addSubview:self.tableview];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    cell.textLabel.text = @"22222";
    return cell;
    
}










@end
