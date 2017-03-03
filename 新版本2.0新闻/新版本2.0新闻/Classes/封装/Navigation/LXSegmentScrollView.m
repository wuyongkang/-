//
//  LXSegmentScrollView.m
//  LiuXSegment
//
//  Created by liuxin on 16/5/17.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#define MainScreen_W [UIScreen mainScreen].bounds.size.width

#import "LXSegmentScrollView.h"
#import "LiuXSegmentView.h"

@interface LXSegmentScrollView()<UIScrollViewDelegate>{
    NSArray* titleArr;
}
@property (strong,nonatomic)UIScrollView *bgScrollView;
@property (strong,nonatomic)LiuXSegmentView *segmentToolView;

@end

@implementation LXSegmentScrollView


-(instancetype)initWithFrame:(CGRect)frame
                  titleArray:(NSArray *)titleArray
            contentViewArray:(NSArray *)contentViewArray
navigationController:(UINavigationController *)nav{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.bgScrollView];
        titleArr = [NSArray arrayWithArray:titleArray];
//        _segmentToolView=[[LiuXSegmentView alloc] initWithFrame:CGRectMake(50, 20, self.frame.size.width - 50, 44) titles:titleArray clickBlick:^void(NSInteger index) {
//            NSLog(@"-----%ld",index);
//            [_bgScrollView setContentOffset:CGPointMake(MainScreen_W*(index-1), 0)];
//        }];
        self.segmentToolView.backgroundColor = [UIColor clearColor];
        self.segmentToolView.bgScrollView.backgroundColor = [UIColor clearColor];
        [nav.view addSubview:self.segmentToolView];
        
        
        for (int i=0;i<contentViewArray.count; i++ ) {
            
            UIView *contentView = (UIView *)contentViewArray[i];
            contentView.frame=CGRectMake(MainScreen_W * i, _segmentToolView.bounds.size.height, MainScreen_W, _bgScrollView.frame.size.height-_segmentToolView.bounds.size.height);
            [_bgScrollView addSubview:contentView];
        }
        
        
    }
    
    return self;
}

-(LiuXSegmentView *)segmentToolView{
    if (!_segmentToolView) {
        _segmentToolView=[[LiuXSegmentView alloc] initWithFrame:CGRectMake(50, 20, self.frame.size.width - 100, 44) titles:titleArr clickBlick:^void(NSInteger index) {
            NSLog(@"-----%ld",index);
            [_bgScrollView setContentOffset:CGPointMake(MainScreen_W*(index-1), 0)];
        }];

    }
    return _segmentToolView;
}

-(UIScrollView *)bgScrollView{
    if (!_bgScrollView) {
        _bgScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, _segmentToolView.frame.size.height, MainScreen_W, self.bounds.size.height-_segmentToolView.bounds.size.height)];
        _bgScrollView.contentSize=CGSizeMake(MainScreen_W*3, self.bounds.size.height-_segmentToolView.bounds.size.height );
        _bgScrollView.backgroundColor=[UIColor whiteColor];
        _bgScrollView.showsVerticalScrollIndicator=NO;
        _bgScrollView.showsHorizontalScrollIndicator=NO;
        _bgScrollView.delegate=self;
        _bgScrollView.bounces=NO;
        _bgScrollView.pagingEnabled=YES;
    }
    return _bgScrollView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    
    [_segmentToolView updateselectLineFrameWithoffset:point.x];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView==_bgScrollView)
    {
        NSInteger p=_bgScrollView.contentOffset.x/MainScreen_W;
        _segmentToolView.defaultIndex=p+1;
        
        
    }
    
}

-(void)likaiciVC{
    [self.segmentToolView removeFromSuperview];
}

@end
