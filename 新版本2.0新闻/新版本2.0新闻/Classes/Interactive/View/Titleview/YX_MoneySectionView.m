//
//  YX_MoneySectionView.m
//  YXBluetooth
//
//  Created by Eric.Wu on 16/12/22.
//  Copyright © 2016年 YXLady. All rights reserved.
//

#import "YX_MoneySectionView.h"
@interface YX_MoneySectionView ()

@property (nonatomic,strong) UIView *indicatorView;

@property (nonatomic,strong) UIView *titleView;

@property (weak, nonatomic) IBOutlet UIButton *ZTBtn;

@property (weak, nonatomic) IBOutlet UIButton *GameBtn;

//@property (nonatomic,strong) UIButton *CZBtn;
//
//@property (nonatomic,strong) UIButton *LXBtn;

@end
@implementation YX_MoneySectionView

+ (instancetype)SectionViewTitleView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_MoneySectionView" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupTitleView];
}

#pragma mark
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.indicatorView.x = self.ZTBtn.x;
}

#pragma mark - 设置标题栏
- (void)setupTitleView
{

    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor whiteColor];
    indicatorView.height = 2;
    indicatorView.y = self.height - indicatorView.height;
    self.indicatorView = indicatorView;
    [self.ZTBtn.titleLabel sizeToFit];
    self.indicatorView.width = self.ZTBtn.titleLabel.width *1.5;
    self.indicatorView.centerX = self.ZTBtn.centerX;
    
    [self ZTBtnClick:self.ZTBtn];
    [self addSubview:indicatorView];
    
}

- (IBAction)ZTBtnClick:(UIButton *)btn {
    
    self.ZTBtn.selected = YES;
    btn.selected = NO;
    self.ZTBtn = btn;
    [UIView animateWithDuration:0.25 animations:^{
        [btn.titleLabel sizeToFit];
        self.indicatorView.width = btn.titleLabel.width * 1.5;
        self.indicatorView.centerX = btn.centerX;
    }];
    if ([self.delegate respondsToSelector:@selector(titleViewDidSelectIndex:)] ) {
        
        [self.delegate titleViewDidSelectIndex:btn.tag];
        
    }
    self.ZTBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    self.GameBtn.transform =  CGAffineTransformIdentity;
    

}
- (IBAction)GameBtnClick:(UIButton *)btn
{
    self.GameBtn.selected = YES;
    btn.selected = NO;
    self.GameBtn = btn;
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = btn.titleLabel.width *1.5;
        self.indicatorView.centerX = btn.centerX;
    }];
    if ([self.delegate respondsToSelector:@selector(titleViewDidSelectIndex:)] ) {
        
        [self.delegate titleViewDidSelectIndex:btn.tag];
        
    }
    self.GameBtn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    self.ZTBtn.transform =  CGAffineTransformIdentity;
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex =  selectIndex;
    
    if (selectIndex == 0) {
        
        [self ZTBtnClick:self.ZTBtn];
        
        
    }else{
        
        
        [self GameBtnClick:self.GameBtn];
    }
}
#pragma mark - 监听contentview拖动
- (void)setContentOffSetX:(CGFloat)contentOffSetX
{
    _contentOffSetX = contentOffSetX;
//    // indicatorView初始宽度
//    CGFloat satrtWidth = 60;
//    // indicatorView最大宽度
//    CGFloat maxWidth  = CGRectGetMaxX(self.GameBtn.frame) - CGRectGetMaxX(self.ZTBtn.frame);
//    // indicatorView最大宽度
//    CGFloat offsetP = contentOffSetX / YX_ScreenWidth;
//    
//    if (self.startContentOffsetX == 0) {
//        
//        if (contentOffSetX < YX_ScreenWidth / 2.0) {
//            self.indicatorView.x = self.ZTBtn.x;
//        [UIView animateWithDuration:0.1 animations:^{
//            if (self.indicatorView.width < maxWidth) {
//                self.indicatorView.width += maxWidth * offsetP;
//
//                }
//            }];
//        }else{
//            CGFloat offsetp1 =  (YX_ScreenWidth - contentOffSetX) / YX_ScreenWidth;
//        
//           [UIView animateWithDuration:0.1 animations:^{
//               if (self.indicatorView.width <= satrtWidth) {
//                   self.indicatorView.width -= maxWidth *  offsetp1/2;
//                   self.indicatorView.x  -= maxWidth *  offsetp1/2;
//               }
//           }];
//            
//        }
//    }else{
//        if (self.startContentOffsetX >= YX_ScreenWidth/2) {
//           CGFloat offsetp1 = contentOffSetX/ YX_ScreenWidth;
//          
//            self.indicatorView.x -= maxWidth *offsetp1 /2;
////            self.indicatorView.width += maxWidth
//        }
//        }
//    
}


@end
