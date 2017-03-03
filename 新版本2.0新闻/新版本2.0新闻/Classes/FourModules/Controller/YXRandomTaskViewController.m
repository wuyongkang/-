//
//  YXRandomTaskViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/9.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXRandomTaskViewController.h"

@interface YXRandomTaskViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray * RandomArr;


@end

@implementation YXRandomTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"不定期任务";
    self.view.backgroundColor = [UIColor whiteColor];
    [self RandomSource];
    [self loadtableview];

}

-(void)RandomSource{
    
    self.RandomArr = [NSMutableArray arrayWithObjects:@"参与来聊写下评论",@"参与来聊点赞评论",@"参与来聊评论被点赞",@"参与来聊回复评论", nil];
}


-(void)loadtableview{
    
    self.tableview =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.tableview];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return 2;
    }
    if (section == 2) {
        return 2;
    }
    if (section == 4) {
        return 2;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 60;
        }else
        {
            return 30;
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 60;
        }else
        {
            return 30;
        }
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 60;
        }else
        {
            return 30;
        }
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 60;
        }else
        {
            return 30;
        }
    }
    
    return 0;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            cell.textLabel.text = @"来聊";
            cell.detailTextLabel.text = @"参与来聊活动，获取积分奖励";
            
        }else{
        
        cell.textLabel.text = self.RandomArr[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"xiaodian"];
            
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"押宝";
            cell.detailTextLabel.text = @"参与押宝活动，获得积分奖励";
        }else
        {
        cell.textLabel.text = @"参与押宝写下评论并进行投注";
        cell.imageView.image = [UIImage imageNamed:@"xiaodian"];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"送礼";
            cell.detailTextLabel.text = @"参与送礼活动，获得积分奖励";
        }else{
        cell.textLabel.text = @"参与送礼获得，点击参与即可获取积分";
        cell.imageView.image = [UIImage imageNamed:@"xiaodian"];
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"秒杀";
            cell.detailTextLabel.text = @"参与秒杀活动，获取积分奖励";
            
        }else{
        cell.textLabel.text = @"参与秒杀活动，购买奖券";
        cell.imageView.image = [UIImage imageNamed:@"xiaodian"];
    }
    }
    return cell;
}

#pragma mark -- tableview 下划线左边置顶
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if ([self.tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableview setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableview setLayoutMargins:UIEdgeInsetsZero];
    }
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
