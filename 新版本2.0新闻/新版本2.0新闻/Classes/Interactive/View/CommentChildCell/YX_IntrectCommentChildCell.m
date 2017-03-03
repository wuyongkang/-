//
//  YX_IntrectCommentChildCell.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentChildCell.h"
#import "YX_intrectChildListModel.h"
@interface YX_IntrectCommentChildCell ()
//评论人头像
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//评论人物姓名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//评论时间
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//内容label
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
//点赞
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
//回复btn
@property (weak, nonatomic) IBOutlet UIButton *replyBtn;

@end
@implementation YX_IntrectCommentChildCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}
- (IBAction)zanBtnClick:(UIButton *)sender
{
    if (self.model.user_support) return;
    sender.selected = !sender.selected;
    self.zanBtnClick(self.model);
}
- (IBAction)replyBtnClick:(UIButton *)sender
{
    
    self.replyBtnClick(self.model);
    
}

- (void)DidCommentChildBtnWithzanBtnClick:(zanBtnClick)zanBtnClick replyBtnClick:(replyBtnClick)replyBtnClick
{
    self.zanBtnClick = zanBtnClick;
    self.replyBtnClick = replyBtnClick;
}

- (void)setModel:(YX_intrectChildListModel *)model
{
    _model = model;
    [self.iconView sd_setImageWithURL:model.portrait_url];
    self.nameLabel.text = model.user_name;
    self.timeLabel.text = model.create_time;
    if (model.user_support) {
        self.zanBtn.selected = YES;
      
    }
    if (model.parent_user_name.length) {
        self.contentLabel.text = [NSString stringWithFormat:@"@%@ : %@",model.parent_user_name,model.content];

    }else{
        self.contentLabel.text = model.content;
    }
    
}
@end
