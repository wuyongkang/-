//
//  ShareView.m
//  Bow
//
//  Created by 李元喜 on 16/12/2.
//  Copyright © 2016年 Chao. All rights reserved.
//

/**
 *  CGAffineTransformMakeTranslation       // 在原有的基础上平移
 CGAffineTransformMakeScale             // 在原有基础上缩放
 CGAffineTransformMakeRotation          // 在原有基础上旋转
 CGAffineTransformIdentity              // 在原有基础上的设置还原
 */

/**
 [UIView animateWithDuration:动画时间 animations:动画设置代码块]
 [UIView animateWithDuration:动画时间 animations:动画设置代码块 completion:动画完成]
 [UIView animateWithDuration:动画时间 delay:动画等待执行时间 options:动画过渡效果 animations:动画设置代码块 completion:动画完成]
 [UIView animateWithDuration:动画时间 delay:动画等待执行时间  usingSpringWithDamping:类似弹簧振动效果 0-1.0 initialSpringVelocity:初始速度 options:动画过渡效果 animations:动画设置代码块 completion:动画完成]
 添加关键帧方法
 [UIView animateKeyframesWithDuration:动画时长 delay:动画等待执行时间 options:动画效果选项 animations:动画设置代码块 completion:动画完成]
 [UIView addKeyframeWithRelativeStartTime:动画相对开始时间 relativeDuration:动画相对持续时间 animations:动画设置代码块]
 
 */
#define ScreenWidth                 [UIScreen mainScreen].bounds.size.width
#define ScreenHeight                [UIScreen mainScreen].bounds.size.height
#define WeakType(type)               __weak typeof(type)weak##type = type


#import "ShareView.h"
#import "YXTypeButton.h"

@interface ShareView ()

@property (nonatomic,strong) NSMutableArray *btnItmeArray;
@property (nonatomic,strong) YXTypeButton *closeBtn;

@end


@implementation ShareView

- (instancetype)initImageNameArray:(NSArray *)imgs withItmeTitleArray:(NSArray *)titles
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.btnItmeArray = [NSMutableArray array];
        self.imageNameArray = imgs;
        self.itmeTitleArray = titles;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, self.frame.size.width, 30)];
        label.text = @"分享可以获得一条狗";
        [self addSubview:label];
        
    }
    return self;
}

- (void)addButtonItmeToAnimationView
{
    // 按钮之间的间隔
    CGFloat spase = (ScreenWidth - _lineItmeNunber * _itmeSize.width)/(_lineItmeNunber + 1);
    
    // 计算有多少行
    NSInteger muchLine = 0;
    
    if (_imageNameArray.count % _lineItmeNunber == 0 ) {
        muchLine = _imageNameArray.count / _lineItmeNunber;
    }
    else
    {
        muchLine = _imageNameArray.count / _lineItmeNunber + 1;
    }
    
    for (NSInteger index = 0; index < _imageNameArray.count; index ++) {
        YXTypeButton *myButton = [YXTypeButton buttonWithType:UIButtonTypeCustom];
        myButton.frame = CGRectMake(spase + (spase + _itmeSize.width) * (index % _lineItmeNunber), (ScreenHeight - muchLine * _itmeSize.height - 30)/2 + _itmeSize.height * (index/_lineItmeNunber), _itmeSize.width, _itmeSize.height);
        myButton.tag = 100 + index;
        myButton.titleLabel.font = _itmeTitleFont;
        [myButton setMyTypeButtonImage:[UIImage imageNamed:_imageNameArray[index]] withTitle:_itmeTitleArray[index] withTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [myButton addTarget:self action:@selector(myTypeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:myButton];
        [self.btnItmeArray addObject:myButton];
        // 把按钮移到屏幕底部
        myButton.transform = CGAffineTransformMakeTranslation(0, ScreenHeight);
    }
    
    [self addSubview:self.closeBtn];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}

-(YXTypeButton *)closeBtn
{
    if (!_closeBtn) {
        _closeBtn = [YXTypeButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setMyTypeButtonBackgroundImage:[UIImage imageNamed:@"icon_close"] withTitle:nil withTitleColor:nil forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(closeSuperButtonView) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn.frame = CGRectMake((ScreenWidth - 30)/2, ScreenHeight - 30, 30, 30);
        
    }
    
    return _closeBtn;
}

- (void)closeSuperButtonView
{
    [UIView animateWithDuration:0.5 animations:^{
        // 旋转45°
        _closeBtn.transform = CGAffineTransformMakeRotation(-M_PI/4);
    }];
    
    [self dismissAnmationView];
    
}

- (void)myTypeButtonClick:(UIButton *)sender
{
    for (NSInteger index = 0; index < _btnItmeArray.count; index ++) {
        __block YXTypeButton *btn = _btnItmeArray[index];
        WeakType(self);
        if (btn == sender) {
            
            [UIView animateWithDuration:0.5 animations:^{
                // 放大
                btn.layer.transform = CATransform3DMakeScale(3, 3, 1);
                btn.alpha = 0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    [weakself removeFromSuperview];
                }];
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                // 缩小
                btn.transform = CGAffineTransformMakeScale(0.001, 0.001);
                btn.alpha = 0;
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
    if (self.yyAnimationButtonItmeClick) {
        self.yyAnimationButtonItmeClick(sender.tag - 100);
    }
}

- (void)showAnimationView
{
    
    for (NSInteger index = 0; index < _btnItmeArray.count; index ++) {
        __block YXTypeButton *btn = _btnItmeArray[index];
        [UIView animateWithDuration:0.5 delay:index * 0.05 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            // 还原位置
            btn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //            NSLog(@"%@",btn);
        }];
        
        
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        
    });
}


- (void)dismissAnmationView
{
    // 把按钮数据翻转过来
    NSArray *flipItmeArray = [[_btnItmeArray reverseObjectEnumerator] allObjects];
    for (NSInteger index = 0; index < flipItmeArray.count; index ++) {
        __block YXTypeButton *btn = flipItmeArray[index];
        WeakType(self);
        [UIView animateWithDuration:0.5 delay:index * 0.05 usingSpringWithDamping:0.9 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            // 设置返回屏幕底部
            btn.transform = CGAffineTransformMakeTranslation(0, ScreenHeight);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                [weakself removeFromSuperview];
            }];
        }];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self closeSuperButtonView];
}


@end
