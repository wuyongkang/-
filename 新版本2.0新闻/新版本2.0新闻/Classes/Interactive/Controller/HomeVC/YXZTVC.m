//
//  YXZTVC.m
//  YXNews
//
//  Created by Eric.Wu on 16/12/24.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "YXZTVC.h"
#import "YX_IntrectHTDetailVC.h"
//model
#import "YX_InteractModel.h"
#import "YX_IntrectZTModel.h"
// view
#import "YX_InteractCell.h"
@interface YXZTVC ()

@property (nonatomic,strong) NSMutableArray *laiLiaoArray;
//互动列表模型
@property (nonatomic,strong) YX_InteractModel *model;


@property (nonatomic,assign) NSInteger page;

@end

@implementation YXZTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self loadIntrectDatas];
    
    self.page = 0;
    
    //设置刷新控件
    [self setupRefresh];
    
}


#pragma mark - setupUI
- (void)setupUI
{

    [self.tableView registerNib:[UINib nibWithNibName:@"YX_InteractCell" bundle:nil] forCellReuseIdentifier:Identifier];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(46, 0, 60, 0);
    self.tableView.rowHeight = 220;
    self.view.backgroundColor = YX_RGBColor(248, 248, 248);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   
}
#pragma Mark - 加载数据
- (void)loadIntrectDatas
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"page"] = @"1";
    dict[@"type"] = @"1";
    [self showProgress:@"正在加载..."];
    NSString *url = [NSString stringWithFormat:@"http://test-newsapi.yxlady.com/v2/hd/1/0.json"];
    [[YXNetworkTool GetShareNetworkTool] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self hideProgress];
        YX_InteractModel *model = [YX_InteractModel mj_objectWithKeyValues:responseObject];
        self.model = model;
        if (model.error == 0) {
           [self.laiLiaoArray addObjectsFromArray:model.data];
            [self.tableView reloadData];
            if (model.hasNext == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }else{
            [self showAlert:@"网络加载错误"];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        YXLog(@"%@",error);
         [self hideProgress];
    }];
}

#pragma mark 设置刷新
- (void)setupRefresh
{
    typeof(self) weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter  footerWithRefreshingBlock:^{
        [weakSelf checkMoreData];
    }];
}
#pragma mark -加载更多互动话题
- (void)loadMoreDatas
{
    [[YXNetworkTool GetShareNetworkTool] GET:self.model.nextUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        YX_InteractModel *model = [YX_InteractModel mj_objectWithKeyValues:responseObject];
        self.model = model;
        if (model.error == 0) {
            [self.laiLiaoArray addObjectsFromArray:model.data];
            [self.tableView reloadData];
        }else{
            [self showAlert:@"网络加载错误"];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 检查是否已经无更多数据
- (void)checkMoreData
{
    if (self.model.hasNext == 0) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
    }else{
        [self loadMoreDatas];
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.laiLiaoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YX_InteractCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    
    cell.model = self.laiLiaoArray[indexPath.row];
    return cell;
}

#pragma mark - tableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YX_IntrectHTDetailVC *vc = [[YX_IntrectHTDetailVC alloc] init];
    YX_IntrectZTModel *model = self.laiLiaoArray[indexPath.row];
    vc.model = model;
    vc.ID = model.ID;
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


#pragma mark - getter
- (NSMutableArray *)laiLiaoArray
{
    if (!_laiLiaoArray) {
        _laiLiaoArray = [NSMutableArray array];
    }
    return _laiLiaoArray;
}


@end
