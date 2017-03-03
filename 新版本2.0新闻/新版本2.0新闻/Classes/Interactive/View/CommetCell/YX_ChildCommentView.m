//
//  YX_ChildCommentView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_ChildCommentView.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectCommentChilFrame.h"
#import "YX_IntrectCommentChildModel.h"
#import "YX_intrectChildListModel.h"
@interface YX_ChildCommentView ()

@property (nonatomic,strong) UILabel *oneCommentLabel;

@property (nonatomic,strong) UILabel *name1Label;

@property (nonatomic,strong) UILabel *name2Label;


@property (nonatomic,strong) UILabel *twoCommentLabel;

@property (nonatomic,strong) UILabel *moreCommentBtn;


@end

@implementation YX_ChildCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YX_RGBColor(248, 247, 247);
        [self addSubview:self.name1Label];
        [self addSubview:self.name2Label];
        [self addSubview:self.oneCommentLabel];
//
        [self addSubview:self.twoCommentLabel];
//
        [self addSubview:self.moreCommentBtn];
        
        
            [self.name1Label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(10);
                make.top.equalTo(self.mas_top).offset(5);
                
            }];
            [self.oneCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.name1Label.mas_right);
                make.right.equalTo(self).offset(-16);
                make.top.equalTo(self.mas_top).offset(5);
            }];
//
            [self.name2Label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.name1Label.mas_left);
                make.top.equalTo(self.name1Label.mas_bottom).offset(5);
            }];
            [self.twoCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.name2Label.mas_right);
                make.right.equalTo(self).offset(-16);
                make.top.equalTo(self.oneCommentLabel.mas_bottom).offset(5);
                
            }];
//
            [self.moreCommentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.mas_left).offset(5);
                make.height.equalTo(@20);
                make.bottom.equalTo(self.mas_bottom).offset(0);
//                make.width.equalTo(@100);
            }];
//        self.moreCommentBtn.backgroundColor = [UIColor redColor];
//
//        }
        
    }
    
    return  self;
}

#pragma mark -setter
- (void)setFrameModel:(YX_IntrectCommentChilFrame *)frameModel
{
    _frameModel = frameModel;
    
    YX_IntrectCommentModel *childModel = frameModel.model;
    
    YX_IntrectCommentChildModel *child = childModel.child;
    
    
    if (child.list.count == 1) {
        YX_intrectChildListModel *model = child.list.firstObject;
        self.name2Label.hidden = YES;
        self.twoCommentLabel.hidden  = YES;
        self.name1Label.text = [NSString stringWithFormat:@"%@ : ",model.user_name];
        self.oneCommentLabel.text = model.content;
        
        NSString *childCount = [NSString stringWithFormat:@"%zd条回复>>",childModel.child_count];
//        YXLog(@"---%@",childCount);
        
        self.moreCommentBtn.text = childCount;
    }else if (child.list.count >= 2){
        
        self.name2Label.hidden = NO;
        self.twoCommentLabel.hidden  = NO;
        YX_intrectChildListModel *model = child.list.firstObject;
        YX_intrectChildListModel *model1 = child.list[1];
        
        self.name1Label.text = [NSString stringWithFormat:@"%@ : ",model.user_name];
        
        self.oneCommentLabel.text = model.content;
        
        NSString *childCount = [NSString stringWithFormat:@"%zd条回复>>",childModel.child_count];
        
        self.name2Label.text = [NSString stringWithFormat:@"%@ : ",model1.user_name];
        
        self.twoCommentLabel.text = model1.content;
        
//        [self.moreCommentBtn setTitle:childCount forState:UIControlStateNormal];
        self.moreCommentBtn.text = childCount;
        
        
    }
}

#pragma mark - getter
- (UILabel *)oneCommentLabel
{
    if (!_oneCommentLabel ) {
        _oneCommentLabel = [[UILabel alloc] init];
        _oneCommentLabel.textColor = YX_RGBColor(102, 102, 102);
        _oneCommentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _oneCommentLabel;
}

- (UILabel *)twoCommentLabel
{
    if (!_twoCommentLabel ) {
        _twoCommentLabel = [[UILabel alloc] init];
        _twoCommentLabel.textColor = YX_RGBColor(102, 102, 102);
        _twoCommentLabel.font = [UIFont systemFontOfSize:14];
    }
    return _twoCommentLabel;
}

- (UILabel *)moreCommentBtn
{
    if (!_moreCommentBtn) {
        _moreCommentBtn = [[UILabel alloc] init];
        
        _moreCommentBtn.font = [UIFont systemFontOfSize:14];

        _moreCommentBtn.textColor = YX_RGBColor(102, 102, 102);
        _moreCommentBtn.textAlignment = NSTextAlignmentLeft;
    }
    return _moreCommentBtn;
}

- (UILabel *)name1Label
{
    if (!_name1Label ) {
        _name1Label = [[UILabel alloc] init];
        _name1Label.textColor = YX_RGBColor(102, 102, 102)
        ;
        _name1Label.font = [UIFont systemFontOfSize:14];
    }
    return _name1Label ;
}

- (UILabel *)name2Label
{
    if (!_name2Label ) {
        _name2Label = [[UILabel alloc] init];
        _name2Label.textColor = YX_RGBColor(102, 102, 102)
        ;
        _name2Label.font = [UIFont systemFontOfSize:14];

    }
    return _name2Label;
}


@end
