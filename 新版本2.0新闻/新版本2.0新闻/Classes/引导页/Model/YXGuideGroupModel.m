//
//  YXGuideGroupModel.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/21.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXGuideGroupModel.h"
#import "YXGuideModel.h"
@implementation YXGuideGroupModel

- (NSMutableArray *)Group
{
    NSMutableArray *array = [NSMutableArray array];
 
    YXGuideModel *model1 = [self modelWithIsSelect:NO iconName:@"beauty" title:@"美容美肤" subTitle:@"给世界一个最美的你"];
    [array addObject:model1];
    
    YXGuideModel *model5 = [self modelWithIsSelect:NO iconName:@"Food" title:@"饕餮美食" subTitle:@"这是一个吃货的世界"];
    [array addObject:model5];
    
    YXGuideModel *model2 = [self modelWithIsSelect:NO iconName:@"chaoliu" title:@"潮流服饰" subTitle:@" 最新最潮一网打尽"];
    [array addObject:model2];
    
    YXGuideModel *model7 = [self modelWithIsSelect:NO iconName:@"keji" title:@"科技范" subTitle:@"欢迎来到极客的世界"];
    [array addObject:model7];
    
    YXGuideModel *model6 = [self modelWithIsSelect:NO iconName:@"keedFit" title:@"美体塑身 " subTitle:@"完美体型由此开始"];
    [array addObject:model6];
    
    YXGuideModel *model3 = [self modelWithIsSelect:NO iconName:@"constellation" title:@"星座运程" subTitle:@"一起来星座运程探秘"];
    [array addObject:model3];
    
    
    YXGuideModel *model4 = [self modelWithIsSelect:NO iconName:@"Family" title:@"家庭亲子" subTitle:@"做个家庭百事通"];
    [array addObject:model4];
    
    YXGuideModel *model = [self modelWithIsSelect:NO iconName:@"art" title:@"文化艺术 " subTitle:@"让文化与艺术流淌你的生命"];
    [array addObject:model];
  
    YXGuideModel *model8 = [self modelWithIsSelect:NO iconName:@"tourism" title:@"旅行" subTitle:@"身心走在路上吧"];
    [array addObject:model8];
    return array;
}

- (YXGuideModel *)modelWithIsSelect:(BOOL)Select iconName:(NSString *)iconName title:(NSString *)title subTitle:(NSString *)subTitle
{
    YXGuideModel *model = [[YXGuideModel alloc] init];
    model.isSelect = Select;
    model.iconName = iconName;
    model.title = title;
    model.subtitle = subTitle;

    return model;
}
@end
