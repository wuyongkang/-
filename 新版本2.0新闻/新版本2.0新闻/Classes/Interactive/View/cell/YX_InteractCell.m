//
//  YX_InteractCell.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 16/12/21.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "YX_InteractCell.h"
#import "YX_IntrectZTModel.h"
@interface YX_InteractCell ()
// 参加人数
@property (weak, nonatomic) IBOutlet UILabel *CountLable;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *SecLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *typeImage;

@end

@implementation YX_InteractCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.backgroundColor = YX_RGBColor(210, 248, 248);
}

- (void)setFrame:(CGRect)frame
{
    CGFloat margin = 10;
    frame.size.height -= margin;
    
    [super setFrame:frame];
    
}

- (void)setModel:(YX_IntrectZTModel *)model
{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:model.img_url];
//    YXLog(@"%@",model.img_url);
    self.CountLable.text = [NSString stringWithFormat:@"%zd",model.join_count];
    
    if ([model.type_name isEqualToString:@"来聊"]) {
        self.typeImage.image = [UIImage imageNamed:@"lailiao"];
    }
    self.detailLabel.text = model.title;
}
@end
