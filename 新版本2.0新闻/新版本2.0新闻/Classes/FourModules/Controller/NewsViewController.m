//
//  NewsViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/23.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "NewsViewController.h"
#import "LXSegmentScrollView.h"


@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *titleArr;//导航title
}

@property (nonatomic, strong) LXSegmentScrollView* scView;
@property (nonatomic, strong) UITableView *commentTableView; //评论
@property (nonatomic, strong) UITableView *myAlertsTableview; //我的通知
@property (nonatomic, strong) UITableView *systemTableview; //系统通知

@property (nonatomic, strong) NSMutableArray *commentArray;
@property (nonatomic, strong) NSMutableArray *myAlertsArray;
@property (nonatomic, strong) NSMutableArray *systemArray;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    [_scView likaiciVC];
    _scView = nil;
    [_scView removeFromSuperview];
  
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
    self.view.backgroundColor=[UIColor whiteColor];
    //iOS7新增属性
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    titleArr=[NSMutableArray array];
    
    self.commentTableView=[[UITableView alloc] init];
   self.commentTableView.delegate=self;
    self.commentTableView.dataSource=self;
    self.commentTableView.rowHeight=100;
    [titleArr addObject:self.commentTableView];
    
    self.myAlertsTableview=[[UITableView alloc] init];
    self.myAlertsTableview.delegate=self;
    self.myAlertsTableview.dataSource=self;
    self.myAlertsTableview.rowHeight=100;
    [titleArr addObject:self.myAlertsTableview];
    
    self.systemTableview=[[UITableView alloc] init];
    self.systemTableview.delegate=self;
    self.systemTableview.dataSource=self;
    self.systemTableview.rowHeight=100;
    [titleArr addObject:self.systemTableview];
    
    [self.view addSubview:self.scView];
}


-(LXSegmentScrollView *)scView{
    if (!_scView) {
        _scView=[[LXSegmentScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) titleArray:@[@"评论",@"我的通知",@"系统通知"] contentViewArray:titleArr navigationController:self.navigationController];
    }
    return _scView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid=@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    if (tableView == self.commentTableView) {
        cell.textLabel.text=@"33333";
        
    }
    if (tableView == self.myAlertsTableview) {
        cell.textLabel.text=@"XXXXX";
        
    }
    if (tableView == self.systemTableview) {
        cell.textLabel.text=@"SSSSS";
        
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
