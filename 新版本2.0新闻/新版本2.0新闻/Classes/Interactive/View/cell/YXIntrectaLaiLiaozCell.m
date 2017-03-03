//
//  YXIntrectaLaiLiaozCell.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/16.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YXIntrectaLaiLiaozCell.h"
#import "YX_IntrectZTModel.h"
@interface YXIntrectaLaiLiaozCell ()

@property (weak, nonatomic) IBOutlet UIImageView *IconView;

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@end
@implementation YXIntrectaLaiLiaozCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.IconView.layer.co
    self.IconView.layer.shouldRasterize = YES;
    
    self.IconView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.IconView.layer.cornerRadius = 25;
    
}

- (IBAction)deleteClick:(id)sender
{
    
}
- (IBAction)zanCLick:(UIButton *)sender
{
    
}

- (IBAction)commentClick:(UIButton *)sender
{
    
}
- (IBAction)shareClick:(UIButton *)sender
{
    
    
}

- (void)setModel:(YX_IntrectZTModel *)model
{
    _model = model;
    
    
    
}

@end
