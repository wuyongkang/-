//
//  YXGuideModel.h
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/21.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXGuideModel : NSObject

// 记录是否选中
@property (nonatomic,assign) BOOL  isSelect;
//图片
@property (nonatomic,copy) NSString *iconName;
//标题
@property (nonatomic,copy) NSString *title;
//子标题
@property (nonatomic,copy) NSString *subtitle;


@end
