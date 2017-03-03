//
//  YXTaskCenterViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/5.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXTaskCenterViewController.h"
#import "YXNewbieTaskViewController.h"//新手任务
#import "YXRandomTaskViewController.h"//不定期任务
@interface YXTaskCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) NSMutableArray *taskArray;//主标题
@property (nonatomic, strong) NSMutableArray *ShareArray;//分享标题
@property (nonatomic, strong) NSMutableArray *subheadArray;//副标题


@end

@implementation YXTaskCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务中心";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self loadSource];
    [self loadTableView];
}

-(void)loadSource
{
    self.taskArray = [NSMutableArray arrayWithObjects:@"每日签到",@"推荐注册",@"阅读新闻",@"点击广告", nil];
    self.subheadArray = [NSMutableArray arrayWithObjects:@"签到领取10积分(连续多天签到更多哦！)",@"每次奖励200积分",@"每次奖励1积分",@"每次奖励2积分", nil];
    self.ShareArray = [NSMutableArray arrayWithObjects:@"分享5篇文章",@"评论3篇新闻",@"分享5篇新闻",@"分享被阅读10次",@"评论被点赞", nil];
    
}

-(void)loadTableView{
    
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];

    [self.view addSubview:self.tableview];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 0;
    }
    
    return 12;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 4;
    }
    if (section == 2) {
        return 4;
    }
    if (section == 3) {
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 50;
    }
    if (indexPath.section == 1) {
        return 50;
    }
    if (indexPath.section == 2) {
        return 30;
    }
    if (indexPath.section == 3) {
        return 50;
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"新手任务";
    }
    
    if (indexPath.section == 1) {
        
        cell.textLabel.text = self.taskArray[indexPath.row];
        cell.detailTextLabel.text = self.subheadArray[indexPath.row];
        
        if (indexPath.row == 0) {
            
            UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(APP_W - 60, 10, 30, 30);
            button.backgroundColor = [UIColor redColor];
            [cell addSubview:button];
        }
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = self.ShareArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"xiaodian"];
        
        cell.textLabel.textColor = [UIColor purpleColor];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
    }
    
    if (indexPath.section == 3) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"不定期任务";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
       
        YXNewbieTaskViewController *new = [[YXNewbieTaskViewController alloc]init];
        [self.navigationController pushViewController:new animated:YES];
    }
    if (indexPath.section == 3) {
        
        YXRandomTaskViewController *Random = [[YXRandomTaskViewController alloc]init];
        [self.navigationController pushViewController:Random animated:YES];
        
    }
    
    
}






@end
