//
//  YKBottomView.h
//  demo
//
//  Created by Eric.Wu on 17/2/20.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickNextStep)();

@class model;
@interface YKBottomView : UIView

@property (nonatomic,assign) int selectCount;

+ (instancetype)bottomView;

@property (nonatomic,copy) clickNextStep clickNextStep;

- (void)bottomViewWithClickNextStep:(clickNextStep)clickNextStep;
@end
