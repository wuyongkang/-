//
//  YXGIFView.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/19.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXGIFView.h"
#import <ImageIO/ImageIO.h>


@interface YXGIFView ()
{
    CGImageSourceRef gif;               // 保存gif动画
    NSDictionary *gifProperties;        // 保存gif动画属性
    size_t index;                       // gif动画播放开始的帧序号
    size_t count;                       // gif动画的总帧数
    NSTimer *timer;                     // 播放gif动画所使用的timer
    
}

@end

@implementation YXGIFView


- (id)initWithFrame:(CGRect)frame filePath:(NSString *)filePath {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount]
                                                    forKey:(NSString *)kCGImagePropertyGIFDictionary];
        gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:filePath], (CFDictionaryRef)gifProperties);
        count =CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(play) userInfo:nil repeats:YES];
        
        // 获取当前要推出的视图
        UIViewController *topVC = [self appRootViewController];
        
        // 定时器开始
        [timer fire];
    }
    
    return self;
}

/**
 *  获取当前要推出的视图
 *
 *  @return 视图
 */
- (UIViewController *)appRootViewController {
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

//当自己重写一个UIView的时候有可能用到这个方法,当本视图的父类视图改变的时候,系统会自动的执行这个方法.newSuperview是本视图的新父类视图.newSuperview有可能是nil.
- (void)willMoveToSuperview:(UIView *)newSuperview {

    if (newSuperview == nil) {
        return;
    }
}

- (id)initWithFrame:(CGRect)frame data:(NSData *)data{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        gifProperties = [NSDictionary dictionaryWithObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount]
                                                    forKey:(NSString *)kCGImagePropertyGIFDictionary];
        //        gif = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:_filePath], (CFDictionaryRef)gifProperties);
        gif = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)gifProperties);
        count =CGImageSourceGetCount(gif);
        timer = [NSTimer scheduledTimerWithTimeInterval:0.12 target:self selector:@selector(play) userInfo:nil repeats:YES];
        [timer fire];
    }
    return self;
}

-(void)play
{
    index ++;
    index = index%count;
    CGImageRef ref = CGImageSourceCreateImageAtIndex(gif, index, (CFDictionaryRef)gifProperties);
    self.layer.contents = (__bridge id)ref;
    CFRelease(ref);
}
-(void)removeFromSuperview
{
    NSLog(@"removeFromSuperview");
    [timer invalidate];
    timer = nil;
    [super removeFromSuperview];
}
- (void)dealloc {
    NSLog(@"dealloc");
    CFRelease(gif);
}
- (void)stopGif
{
    [timer invalidate];
    timer = nil;
}







@end
