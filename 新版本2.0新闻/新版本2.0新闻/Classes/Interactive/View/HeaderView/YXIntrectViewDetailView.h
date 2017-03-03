//
//  YXIntrectViewDetailView.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/13.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YX_IntrectZTModel;
@interface YXIntrectViewDetailView : UIView

@property (nonatomic,strong) YX_IntrectZTModel *model;

+ (instancetype)IntrectViewDetailView;
@end
