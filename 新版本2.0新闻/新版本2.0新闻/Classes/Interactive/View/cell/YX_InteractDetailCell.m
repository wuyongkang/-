//
//  YX_InteractDetailCell.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/4.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_InteractDetailCell.h"
@interface YX_InteractDetailCell ()
// 头像
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
//名字
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//投注金额
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
//发表时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//评论内容
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation YX_InteractDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
  
}



@end
