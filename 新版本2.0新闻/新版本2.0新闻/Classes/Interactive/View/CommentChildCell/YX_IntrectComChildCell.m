//
//  YX_IntrectComChildCell.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectComChildCell.h"
#import "YX_intrectChildListModel.h"
@interface YX_IntrectComChildCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation YX_IntrectComChildCell

- (void)awakeFromNib {
    [super awakeFromNib];


}

- (void)setModel:(YX_intrectChildListModel *)model
{
    _model = model;
    
    [self.iconView sd_setImageWithURL:model.portrait_url];
    self.nameLabel.text = model.user_name;
    self.timeLabel.text = model.create_time;
    self.contentLabel.text = model.content;
    
    
}


@end
