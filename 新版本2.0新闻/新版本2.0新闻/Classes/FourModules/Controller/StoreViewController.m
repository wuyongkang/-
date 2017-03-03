//
//  StoreViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/23.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "StoreViewController.h"
#import "LncomelipingXB.h"

@interface StoreViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商城";
    [self loadCollectionView];
}


- (void)loadCollectionView
{
    //布局类：控制每一个Item的样式
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.view = [[UIView alloc]init];
    //改变每一个Item的大小
    flowLayout.itemSize = CGSizeMake(_collectionView.frame.size.width / 2 -16, 181);
    flowLayout.sectionInset = UIEdgeInsetsMake(12, 8, 12, 8);
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UINib *nib = [UINib nibWithNibName:@"LncomelipingXB" bundle:nil];
    [_collectionView registerNib:nib  forCellWithReuseIdentifier:@"cell"];
    //给collectionView注册一个footerView
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"jifenfooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [self.view addSubview:self.collectionView];
   
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LncomelipingXB *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    return cell;
}

//点击元素触发事件
-(void)collectionView:(UICollectionView*)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    NSLog(@"2");
}

@end
