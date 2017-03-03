//
//  YXTooltipView.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/17.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXTooltipView.h"

@implementation YXTooltipView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"YXTooltipView" owner:nil options:nil] firstObject];
        
    }
    return self;
}

@end
