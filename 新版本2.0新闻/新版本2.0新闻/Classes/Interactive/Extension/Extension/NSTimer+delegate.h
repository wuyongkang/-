//
//  NSTimer+delegate.h
//  model
//
//  Created by Eric.Wu on 16/2/3.
//  Copyright © 2016年 Eric.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (delegate)

+(NSTimer *)scheduledTimerWithTimeInterval:(int)timeInterval block:(void(^)())block repeats:(BOOL)yesOrNo;



@end
