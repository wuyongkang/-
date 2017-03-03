//
//  YX_IntrectInputAccessView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/20.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectInputAccessView.h"

@implementation YX_IntrectInputAccessView

+ (instancetype)IntrectInputAccessView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_IntrectInputAccessView" owner:nil options:nil] lastObject];
}

@end
