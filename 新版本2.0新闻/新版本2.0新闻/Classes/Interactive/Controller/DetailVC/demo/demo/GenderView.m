//
//  GenderView.m
//  demo
//
//  Created by Eric.Wu on 17/2/20.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "GenderView.h"

@implementation GenderView

+ (instancetype)GenderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"GenderView" owner:nil options:nil] lastObject];
}

@end
