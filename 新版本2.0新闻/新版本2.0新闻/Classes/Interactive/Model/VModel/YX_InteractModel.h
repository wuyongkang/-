//
//  YX_InteractModel.h
//  新版本2.0新闻
//
//  Created by Eric.Wu on 16/12/21.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YX_BaseModel.h"

@interface YX_InteractModel : YX_BaseModel

@property (nonatomic,strong) NSArray *data;

@property (nonatomic,assign) NSInteger  hasNext;

@property (nonatomic,copy) NSString *nextUrl;
@end
