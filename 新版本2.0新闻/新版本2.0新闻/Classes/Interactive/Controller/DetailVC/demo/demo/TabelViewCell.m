//
//  TabelViewCell.m
//  demo
//
//  Created by Eric.Wu on 17/2/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "TabelViewCell.h"

#define srceenH [UIScreen mainScreen].bounds.size.height
@interface TabelViewCell ()
@property (weak, nonatomic) IBOutlet UIView *view;

@property (nonatomic,assign) BOOL isanimate;


@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
@implementation TabelViewCell



- (void)setIdp:(NSIndexPath *)idp
{
    _idp = idp;
    
    int count = srceenH / 150;
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    if (idp.row > count) {
        return;
    }
    if (self.isanimate) { return; }
    
    
    
    self.view.alpha = 0;
    self.view.transform = CGAffineTransformMakeTranslation(0, srceenH * 0.5);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * idp.row * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.view.transform = CGAffineTransformIdentity;
            self.view.alpha = 1;
            
        } completion:^(BOOL finished) {
            
            self.isanimate = YES;
        }];
        
        
    });
    
}

- (void)setModel:(model *)model
{
    _model= model;
    if (model.isSelect ) {
        self.btn.selected = YES;
    }else{
        self.btn.selected = NO;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
   
    
}



@end
