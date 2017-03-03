//
//  YXGuideController.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/21.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXGuideController.h"
#import "YXGenderController.h"
#import "YXGuideModel.h"
#import "YXGuideGroupModel.h"
#import "YKBottomView.h"
#import "YXGuideCell.h"
#import "YXBGView.h"
#define bottomH 60
@interface YXGuideController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tabelView;

@property (nonatomic,strong) NSMutableArray *array;

@property (nonatomic,strong) YKBottomView *bottomView;

@property (nonatomic,assign) int count;

@property (nonatomic,strong) YXBGView *bgView;

@property (nonatomic,strong) NSMutableArray *channelsArray;

@end

@implementation YXGuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.count = 0;
    
    [self setupUI];
    YXGuideGroupModel *model  = [[YXGuideGroupModel alloc] init];
    self.array = model.Group;
    
}

- (void)setupUI
{
    [self.view addSubview:self.bgView];
    
    [self.bgView bgViewWithPanGesture:^{
        [self.view addSubview:self.tabelView];
        [self.view addSubview:self.bottomView];
    }];
    [self.bottomView bottomViewWithClickNextStep:^{
        YXGenderController *vc = [[YXGenderController alloc] init];
        vc.array = self.array;
        [self presentViewController:vc animated:NO completion:nil];
    }];
    
    self.tabelView.rowHeight = 150;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self.tabelView registerNib:[UINib nibWithNibName:@"YXGuideCell" bundle:nil] forCellReuseIdentifier:@"Identifier"];
   
}

#pragma mark - 模型数据

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXGuideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    cell.idp = indexPath;
    cell.model = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXGuideModel *m = self.array[indexPath.row];
   
    if (m.isSelect) {
        m.isSelect = NO;
        self.count--;
        self.bottomView.selectCount = self.count;
        
        
    }else{
        m.isSelect = YES;
        self.count++;
        
        self.bottomView.selectCount = self.count;
        
        
    }
    
    [self.tabelView reloadData];
}


- (UITableView *)tabelView
{
    if (!_tabelView ) {
        
        CGRect frame = CGRectMake(0,0,self.view.bounds.size.width , self.view.bounds.size.height - bottomH);
        _tabelView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tabelView;
}


- (NSMutableArray *)array
{
    if (!_array ) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (NSMutableArray *)channelsArray
{
    if (!_channelsArray ) {
        _channelsArray = [[NSMutableArray alloc] init];
    }
    return _channelsArray;
}

- (YKBottomView *)bottomView
{
    if (!_bottomView ) {
        _bottomView = [YKBottomView bottomView];
        _bottomView.frame = CGRectMake(0, YX_ScreenHeight - bottomH, YX_ScreenWidth, bottomH);
    }
    return _bottomView;
}

- (YXBGView *)bgView
{
    if (!_bgView ) {
        _bgView = [YXBGView BGView];
        _bgView.frame = CGRectMake(0, 0, YX_ScreenWidth, YX_ScreenHeight);
        
    }
    return _bgView;
}

@end
