//
//  YXTabbarView.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/11.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXTabbarView.h"
#import "YXNewsPrefixHeader.pch"

@implementation YXTabbarView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"YXTabbarView" owner:nil options:nil] firstObject];
    
        
    }
    return self;
}
@end

