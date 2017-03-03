//
//  SunCartoonView.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/19.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SunCartoonView : UIView


-(void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration;



+(void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration maxSize:(CGFloat)fMaxSize durationPerBeat:(CGFloat)fDurationPerBeat;


//太阳动画
- (void)showTheApplauseInView:(UIView *)view belowView:(UIButton *)v;

@end
