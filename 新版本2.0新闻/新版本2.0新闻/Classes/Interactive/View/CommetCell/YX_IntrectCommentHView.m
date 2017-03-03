//
//  YX_IntrectCommentHView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentHView.h"
#import "YX_IntrectCommentHFrame.h"
#import "YX_IntrectCommentModel.h"
@interface YX_IntrectCommentHView ()

@property (nonatomic,strong) UIImageView *iconView;

@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UIButton *button;

@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation YX_IntrectCommentHView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.iconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.timeLabel];
//        [self addSubview:self.button];
        [self addSubview:self.contentLabel];
//        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self).offset(-16);
//            make.top.equalTo(self).offset(16);
//        }];
    }
    
    return self;
    
}

- (void)setFrameModel:(YX_IntrectCommentHFrame *)FrameModel
{
    _FrameModel = FrameModel;
    
    [self.iconView sd_setImageWithURL:FrameModel.model.portrait_url];
    
    self.iconView.frame = FrameModel.iconFrame;
    
    self.nameLabel.text = FrameModel.model.user_name;
    self.nameLabel.frame = FrameModel.nameFrame;
    
    self.timeLabel.text = FrameModel.model.create_time;
    self.timeLabel.frame = FrameModel.timeFrame;
    
    self.contentLabel.frame = FrameModel.contentFrame;
    self.contentLabel.text = FrameModel.model.content;
    
//    if ([FrameModel.model.user_id isEqualToString:@""]) {
//        self.button.hidden =
//    }
}


- (UIImageView *)iconView
{
    if (!_iconView ) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel ) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = YX_RGBColor(51, 51, 51);
    }
    return _nameLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel ) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = YX_RGBColor(130, 130, 130);
    }
    return _timeLabel;
}

- (UIButton *)button
{
    if (!_button ) {
        _button = [[UIButton alloc] init];
        _button.titleLabel.font = [UIFont systemFontOfSize:14];
        [_button setTitle:@"删除" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
    }
    return _button;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel ) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = YX_RGBColor(102, 102, 102);
    }
    return _contentLabel;
}

@end
