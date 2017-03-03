//
//  model.h
//  demo
//
//  Created by Eric.Wu on 17/2/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject

// 记录是否选中
@property (nonatomic,assign) BOOL  isSelect;

// 选中次数
@property (nonatomic,assign) int   selectCount;

@end
