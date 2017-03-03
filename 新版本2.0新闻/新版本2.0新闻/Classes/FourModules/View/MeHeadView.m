//
//  MeHeadView.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/20.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "MeHeadView.h"

@implementation MeHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"MeHeadView" owner:nil options:nil] firstObject];

    }
    return self;
}

@end
