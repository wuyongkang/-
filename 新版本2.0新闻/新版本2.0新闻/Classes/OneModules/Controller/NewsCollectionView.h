//
//  NewsCollectionView.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/29.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol collectionDidSelectDelegate <NSObject>

- (void)didSelectDelegate:(NSIndexPath *)indexPath;

@end

@interface NewsCollectionView : UITableViewCell


@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat hightED;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) id<collectionDidSelectDelegate>didDelegate;



@end
