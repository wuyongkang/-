//
//  NSTimer+delegate.m
//  model
//
//  Created by Eric.Wu on 16/2/3.
//  Copyright © 2016年 Eric.Wu. All rights reserved.
//

#import "NSTimer+delegate.h"

@implementation NSTimer (delegate)
+(NSTimer *)scheduledTimerWithTimeInterval:(int)timeInterval block:(void(^)())block repeats:(BOOL)yesOrNo
{     return [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(callBlock:) userInfo:[block copy] repeats:yesOrNo];
}
+(void)callBlock:(NSTimer *)timer {
    void(^block)() = timer.userInfo;     if (block != nil) {         block();
} }

@end
