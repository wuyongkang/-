//
//  YXInteractiveVC.m
//  YXNews
//
//  Created by Eric.Wu on 16/12/21.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "YXInteractiveVC.h"
#import "YX_IntrectHTDetailVC.h"
#import "YXZTVC.h"
#import "YXGameVC.h"
#import "YX_MoneySectionView.h"
@interface YXInteractiveVC ()<UIScrollViewDelegate,YX_MoneySectionViewDelegate>

@property (nonatomic,strong) YX_MoneySectionView *titleView;

@property (nonatomic,strong) UIScrollView *contentView;

@end

@implementation YXInteractiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitleView];
    [self setupChildVC];
    [self setupContentView];

}
#pragma mark - 设置标题栏
- (void)setupTitleView
{
//    self.navigationItem.titleView = self.titleView;
    [self.view addSubview:self.titleView];
    
    self.navigationController.navigationBarHidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark -设置所有按钮
- (void)setupChildVC
{
    YXZTVC *ZTVC = [[YXZTVC alloc] init];
//    ZTVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:ZTVC];
    YXGameVC *gameVC = [[YXGameVC alloc] init];
//    gameVC.view.backgroundColor = [UIColor orangeColor];
    [self addChildViewController:gameVC];
    
}

#pragma mark -设置内容view
- (void)setupContentView
{
    UIScrollView *contentView = [[UIScrollView alloc] init];
    self.automaticallyAdjustsScrollViewInsets = NO;
    contentView.frame = self.view.bounds;
    contentView.bounces = NO;
    self.contentView = contentView;
    
    contentView.delegate = self;
    
    contentView.pagingEnabled = YES;
    contentView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 0);
    
    [self.view insertSubview:contentView atIndex:0];
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
    
    
}

#pragma mark - titleviewDelegate
- (void)titleViewDidSelectIndex:(NSInteger)Index
{
    CGPoint offset = self.contentView.contentOffset;
    offset.x = Index * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark - scrollView delegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UITableViewController *Vc = self.childViewControllers[index];
    
    Vc.view.x = scrollView.contentOffset.x;
    
    Vc.view.height = scrollView.height;
    Vc.view.y = 20;
    Vc.view.width = scrollView.width;
   
    [scrollView addSubview:Vc.view];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    YXLog(@"%.2f",scrollView.contentOffset.x);
    
    self.titleView.contentOffSetX = scrollView.contentOffset.x;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{    //拖动前的起始坐标
    
    self.titleView.startContentOffsetX = scrollView.contentOffset.x;
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
//    willEndContentOffsetX = scrollView.contentOffset.x;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    self.titleView.selectIndex  = index;
    
    YXLog(@"%.2f",scrollView.contentOffset.x);
    
}


- (void)dealloc
{
    
//    YXLog(@"dealloc");
}
#pragma mark - getter
- (YX_MoneySectionView *)titleView
{
    if (!_titleView ) {
        _titleView = [YX_MoneySectionView SectionViewTitleView];
        _titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        _titleView.delegate = self;
    }
    return _titleView;
}

@end
