//
//  YX_IntrectTitleView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/13.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectTitleView.h"
@interface YX_IntrectTitleView ()


@property (strong, nonatomic) UIButton *ZTBtn;

@property (strong, nonatomic) UIButton *GameBtn;

@property (nonatomic,strong) UIView *indicatorView;
@end
@implementation YX_IntrectTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.ZTBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(10);
        }];
    }
    return self;
}

#pragma mark - ZTBtn
- (UIButton *)ZTBtn
{
    if (!_ZTBtn ) {
        _ZTBtn = [[UIButton alloc] init];
        
    }
    return _ZTBtn;
}

- (UIButton *)GameBtn
{
    if (!_GameBtn ) {
        _GameBtn = [[UIButton alloc] init];
    }
    return _GameBtn;
}

- (UIView *)indicatorView
{
    if (!_indicatorView ) {
        _indicatorView = [[UIView alloc] init];
    }
    return _indicatorView;
}


@end
