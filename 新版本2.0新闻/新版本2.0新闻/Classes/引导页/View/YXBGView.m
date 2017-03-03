//
//  YXBGView.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/21.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXBGView.h"
@interface YXBGView ()

@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@end
@implementation YXBGView
+ (instancetype)BGView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YXBGView" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
        self.bgView.alpha = 0;
        [UIView animateWithDuration:0.5 animations:^{
    
        } completion:^(BOOL finished) {
            
                self.bgView.alpha = 1;
               
                UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
                [self.bgView addGestureRecognizer:pan];
           
        }];
    
}
#pragma mark - 监听手势
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan
{
//    CGPoint p  =  [pan translationInView:self];
    self.PanGesture();
}

- (void)bgViewWithPanGesture:(PanGestureBGView)PanGesture
{
    self.PanGesture = PanGesture;
}
@end
