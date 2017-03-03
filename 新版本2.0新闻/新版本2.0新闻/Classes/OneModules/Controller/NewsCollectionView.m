//
//  NewsCollectionView.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/29.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "NewsCollectionView.h"
#import "NewsCollectionCell.h"

@interface NewsCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end


@implementation NewsCollectionView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self loadCollectionView];
        [self.contentView addSubview:self.collectionView];
    
    }
    
    return self;
}


- (void)loadCollectionView
{
    _layout = [[UICollectionViewFlowLayout alloc]init];
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.itemSize = CGSizeMake(self.frame.size.height, self.frame.size.height);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:_layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
//    [_collectionView registerClass:[NewsCollectionCell class] forCellWithReuseIdentifier:@"ITEM"];
      [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    
    UINib *nib = [UINib nibWithNibName:@"NewsCollectionCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"ITEM"];
    _collectionView.showsHorizontalScrollIndicator = NO;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header;
  
 
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    _collectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _layout.itemSize = CGSizeMake(self.frame.size.height , self.frame.size.height);
//    _layout.minimumInteritemSpacing = 1;
    [_collectionView reloadData];

}

- (void)setDataArray:(NSMutableArray *)dataArray
{
    if (dataArray.count != 0) {
        _dataArray = dataArray;
        [self.collectionView reloadData];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    if (self.dataArray.count == 0 || nil == self.dataArray) {
//        return 0;
//    }else{
//        return self.dataArray.count;
//    }
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ITEM" forIndexPath:indexPath];
    

    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了~~%ld", indexPath.row);
    if (self.didDelegate && [self.didDelegate respondsToSelector:@selector(didSelectDelegate:)]) {
        [self.didDelegate didSelectDelegate:indexPath];
    }
}













@end
