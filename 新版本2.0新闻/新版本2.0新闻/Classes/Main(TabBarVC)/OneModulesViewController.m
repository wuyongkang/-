//
//  OneModulesViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/12.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "OneModulesViewController.h"
#import "DCPicScrollView.h"
#import "DCWebImageManager.h"
#import "YXNewsPrefixHeader.pch"
#import "NewsCollectionView.h"
#import "NewsModel.h"
#import "YXtempModel.h"
#import "NewsTypeOneCell.h"
#import "NewsTypeTwoCell.h"
#import "NewsTypeZeroCell.h"
#import "YXTaskCenterViewController.h"
#import "YXDetailsViewController.h"//新闻详情

@interface OneModulesViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

//@property (nonatomic, strong) YXNetWork *YxnetWork;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, weak) UIButton *upBtn;
@property (nonatomic, strong) NSMutableArray *tempArr;//轮播图
@property (nonatomic, strong) NSMutableArray *tempTitleArr;
@property (nonatomic, strong) NSMutableArray *cellArray;

@end

@implementation OneModulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellArray = [NSMutableArray array];
    self.tempArr = [NSMutableArray array];
    self.tempTitleArr = [NSMutableArray array];
    
    UIColor *testColor1= [UIColor colorWithRed:2/255.0 green:174/255.0 blue:236/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = testColor1;
    
    //    self.tempArr = [NSMutableArray arrayWithObjects:@"png-1",@"png-2",@"png-3",@"png-4",@"png-5", nil];
    
    [self loadTableView];
    [self setUpBtn];
    [self GetDataNews];
}

-(void)loadTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UINib *nib = [UINib  nibWithNibName:@"NewsTypeOneCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"OneCell"];
    
    UINib *nib1 = [UINib  nibWithNibName:@"NewsTypeTwoCell" bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"TwoCell"];
    
    UINib *nib2 = [UINib  nibWithNibName:@"NewsTypeZeroCell" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"ZeroCell"];
    
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:self.tableView];
}

- (void)setUpBtn
{
    UIButton *upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    upBtn.frame = CGRectMake(APP_W - 70, APP_H * 0.8, 44, 44);
    [upBtn setBackgroundImage:[UIImage imageNamed:@"icon_back_top"] forState:UIControlStateNormal];
    upBtn.hidden = YES;
    [upBtn addTarget:self action:@selector(backTop) forControlEvents:UIControlEventTouchUpInside];
    self.upBtn = upBtn;
    [self.view addSubview:upBtn];
    
}

#pragma mark - scroll代理
//滑动高度大于APP-H的时候显示UpBtn按钮
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > ScreenHeight) {
        self.upBtn.hidden = NO;
    } else {
        self.upBtn.hidden = YES;
    }
}

#pragma mark - 内部私有方法
- (void)backTop
{
    [self.tableView setContentOffset:CGPointZero animated:YES];
}

#pragma mark - TableView代理方法
// tableView数据源代理方法啊
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel * model = [[NewsModel alloc]init];
    model = self.cellArray[indexPath.row];
    if ([model.layoutType intValue]==2) {
        return  120;
    }
    if ([model.layoutType intValue] == 3) {
        return  180;
    }
    if ([model.layoutType intValue] == 4) {
        return 200;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * yxCell = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:yxCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:yxCell];
    }
    
    if (self.cellArray.count > 0) {
        
        NewsModel * model = [[NewsModel alloc]init];
        model = self.cellArray[indexPath.row];
        NSLog(@"type --- %@",model.layoutType);
        if ([model.layoutType intValue] == 2) {
            
            NewsTypeOneCell *newsCell  = [tableView dequeueReusableCellWithIdentifier:@"OneCell"];
            newsCell.selectionStyle = UITableViewCellSelectionStyleNone;
//            [newsCell.image sd_setImageWithURL:[NSURL URLWithString:model.img]];
            [newsCell.image sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"png-1"]];
            
            newsCell.title.text = model.title;
            newsCell.ChannelNameLabel.text = model.channelName;
            newsCell.commentLabel.text = model.commentCount;
            newsCell.timeLabel.text = [timeStamp compareCurrentTime:model.createTime];
            
            return newsCell;
        }
        if ([model.layoutType intValue] == 3) {
            
            NewsTypeTwoCell *typeCell = [tableView dequeueReusableCellWithIdentifier:@"TwoCell"];
            typeCell.selectionStyle = UITableViewCellSelectionStyleNone;
            [typeCell.image sd_setImageWithURL:[NSURL URLWithString:model.img]];
            typeCell.title.text = model.title;
            typeCell.commentLabel.text = model.commentCount;
            typeCell.channelnameLabel.text = model.channelName;
            typeCell.createTimeLabel.text = [timeStamp compareCurrentTime:model.createTime];
            return typeCell;
        }
        if ([model.layoutType intValue] == 4) {
            [self.tableView registerClass:[NewsCollectionView class] forCellReuseIdentifier:@"COLLCELL"];
            NewsCollectionView * NCELL = [tableView dequeueReusableCellWithIdentifier:@"COLLCELL"];
            
            return NCELL;
            
            
        }
    }
    return cell;
}
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc]init];
    DCPicScrollView * picView = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 200) WithImageUrls:self.tempArr];
    [headerView addSubview:picView];
    //占位图片,你可以在下载图片失败处修改占位图片
    picView.placeImage = [UIImage imageNamed:@"bg_guide_6_1"];
    picView.titleData = self.tempTitleArr;
    //图片被点击事件,当前第几张图片被点击了,和数组顺序一致
    [picView setImageViewDidTapAtIndex:^(NSInteger index) {
        
        YXDetailsViewController * DetailsVC = [[YXDetailsViewController alloc]init];
        [self.navigationController pushViewController:DetailsVC animated:YES];
        
        NSLog(@"可以的%ld",(long)index);
        
    }];
    picView.AutoScrollDelay = 3.5f;
    [[DCWebImageManager shareManager] setDownloadImageRepeatCount:2];
    [[DCWebImageManager shareManager] setDownLoadImageError:^(NSError *error, NSString *url) {
        NSLog(@"%@",error);
    }];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

#pragma mark --- 解析
-(void)GetDataNews{
    
    //    NSString *url = @"http://app3.qdaily.com/app3/homes/index/0.json";
    NSString * homeUrl = [NSString stringWithFormat:@"%@home/index",YXNewsURL];
    
    AFHTTPSessionManager *sess = [AFHTTPSessionManager manager];
    sess.requestSerializer = [AFHTTPRequestSerializer serializer];
    sess.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [sess GET:homeUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dict --- %@",dict);
        
        //        NSDictionary *dic = dict[@"response"];
        NSArray    *array = dict[@"list"]; //cell
        NSArray    *lunArray = dict[@"banner"];
        
        for (NSDictionary * a in array) {
            NewsModel *model = [[NewsModel alloc]init];
            
            [model setValuesForKeysWithDictionary:a];
            [model setValuesForKeysWithDictionary:a[@"data"]];
            [self.cellArray addObject:model];
            
        }
        
        for (NSDictionary * b in lunArray) {
            YXtempModel *model = [[YXtempModel alloc]init];
            [model setValuesForKeysWithDictionary:b];
            [self.tempArr addObject:model.img];
            [self.tempTitleArr addObject:model.title];
            NSLog(@"model ---- %@,%@",model.img,model.title);
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YXDetailsViewController * DetailsVC = [[YXDetailsViewController alloc]init];
    NewsModel *model = [[NewsModel alloc]init];
    model = self.cellArray[indexPath.row];
    DetailsVC.detailsURL = model.url;
    [self.navigationController pushViewController:DetailsVC animated:YES];
}

@end
