//
//  MoneyViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/27.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "MoneyViewController.h"
#import "WXTableViewCell.h"  //微信cell
#import "AliPayTableViewCell.h"//支付宝CELL

@interface MoneyViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arr;


@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"余额提现";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationController.navigationBar.titleTextAttributes =@{UITextAttributeTextColor: [UIColor purpleColor],UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    
    [self loadTabelView];
    
}

-(void)loadTabelView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    if (section == 2) {
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * yxCell = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:yxCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:yxCell];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            UINib *nib = [UINib nibWithNibName:@"WXTableViewCell" bundle:nil];
            [self.tableView registerNib:nib forCellReuseIdentifier:@"WXCELL"];
            WXTableViewCell *WXcell = [tableView dequeueReusableCellWithIdentifier:@"WXCELL"];
            WXcell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
            
            return WXcell;
        }
    }
    if (indexPath.section == 1) {
        
        UINib *nib = [UINib nibWithNibName:@"AliPayTableViewCell" bundle:nil];
        [self.tableView registerNib:nib forCellReuseIdentifier:@"AliPayCELL"];
        AliPayTableViewCell *alicell = [tableView dequeueReusableCellWithIdentifier:@"AliPayCELL"];
        alicell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        
        return alicell;
    }
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            
            cell.textLabel.text = @"添加支付方式";
            
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            
        }
    }
    return cell;
}








@end
