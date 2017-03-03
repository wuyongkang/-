//
//  YX_MoneySectionView.h
//  YXBluetooth
//
//  Created by Eric.Wu on 16/12/22.
//  Copyright © 2016年 YXLady. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YX_MoneySectionView;
@protocol YX_MoneySectionViewDelegate <NSObject>

@optional
- (void)titleViewDidSelectIndex:(NSInteger)Index;
@end
@interface YX_MoneySectionView : UIView


@property (nonatomic,assign) id<YX_MoneySectionViewDelegate>  delegate;

// 选中按钮
@property (nonatomic,assign) NSInteger  selectIndex;

@property (nonatomic,assign) CGFloat  contentOffSetX;

//开始滚动坐标x位置
@property (nonatomic,assign) CGFloat  startContentOffsetX;

+ (instancetype)SectionViewTitleView;
@end
