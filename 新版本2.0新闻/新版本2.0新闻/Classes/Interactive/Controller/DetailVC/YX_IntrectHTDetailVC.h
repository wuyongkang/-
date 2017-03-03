//
//  YX_IntrectHTDetailVC.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/13.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "BSViewController.h"
@class YX_IntrectZTModel;
@interface YX_IntrectHTDetailVC : BSViewController
// 话题id
@property (nonatomic,copy) NSString *ID;

@property (nonatomic,strong) YX_IntrectZTModel *model;
@end
