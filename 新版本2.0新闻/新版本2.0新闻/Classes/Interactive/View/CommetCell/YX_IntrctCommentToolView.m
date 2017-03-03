//
//  YX_IntrctCommentToolView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrctCommentToolView.h"
#import "YX_IntrectComentToolFrame.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectCommentChildModel.h"
@interface YX_IntrctCommentToolView ()

@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;

@end

@implementation YX_IntrctCommentToolView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.zanBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
}
+ (instancetype)IntrctCommentToolView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_IntrctCommentToolView" owner:nil options:nil] lastObject];
}
- (IBAction)shareClick:(id)sender
{
    self.shareBtnClick();
}

- (IBAction)commentClick:(id)sender
{
    self.commentBtnClick();
}

- (IBAction)zanClick:(UIButton *)sender
{
    
    if (sender.selected) {
        return;
    }
    sender.selected = YES;
    self.zanBtn.selected = YES;
    YX_IntrectCommentModel *model = self.toolFrame.model;
   
    self.zanBtnClick(model);
}

- (void)setToolFrame:(YX_IntrectComentToolFrame *)toolFrame
{
    _toolFrame = toolFrame;
    YX_IntrectCommentModel *model = toolFrame.model;
  
    
    if (model.child_count > 0) {
        NSString *count = [NSString stringWithFormat:@" %zd",model.child_count];
        [self.commentBtn setTitle:count forState:UIControlStateNormal];
    }else{
       [self.commentBtn setTitle:@" 评论" forState:UIControlStateNormal];
    }
    NSString *zan = [NSString stringWithFormat:@" %zd",model.support];

    if (model.user_support == 1) {
        self.zanBtn.selected  = YES;
   
    }else{
        self.zanBtn.selected = NO;
    }
    
    [self.zanBtn setTitle:zan forState:UIControlStateNormal];
    
}


- (void)DidCommentCellBtnWithzanBtnClick:(zanBtnClick)zanBtnClick commentBtnClick:(commentBtnClick)commentBtnClick shareBtnClick:(shareBtnClick)shareBtnClick
{
    self.zanBtnClick = zanBtnClick;
    self.commentBtnClick = commentBtnClick;
    self.shareBtnClick = shareBtnClick;
}


@end
