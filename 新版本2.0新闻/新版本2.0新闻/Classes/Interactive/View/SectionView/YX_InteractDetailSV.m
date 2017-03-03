//
//  YX_InteractDetailSV.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/4.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_InteractDetailSV.h"

@interface YX_InteractDetailSV ()

@end
@implementation YX_InteractDetailSV

+ (instancetype)interactDetailSectionView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_InteractDetailSV" owner:nil options:nil] lastObject];
}


@end
