//
//  YX_IntertractBottomV.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/4.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntertractBottomV.h"
#import "UITextView+KCExtension.h"
@interface YX_IntertractBottomV ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *danmuBtn;


@end
@implementation YX_IntertractBottomV

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.inputTextField.backgroundColor = [UIColor clearColor];
    self.inputTextField.kc_placeholder = @"发表评论";
    self.inputTextField.returnKeyType = UIReturnKeySend;
    
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        self.sencomment();
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
    
  
}


- (IBAction)shareBtnClick:(id)sender
{
    self.shareButtonBlock();
}
- (IBAction)CollectionBtnClick:(id)sender
{
    self.CollectionButtonBlock();
}

- (IBAction)danMuClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.danMuButtonBlock(sender);
}


+ (instancetype)intertractBottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_IntertractBottomV" owner:nil options:nil] lastObject];
}

- (void)shareWithShareButtonBlock:(ShareButtonBlock)shareButtonBlock WithCollectionButtonBlock:(CollectionButtonBlock)CollectionButtonBlock WithTanMuButtonClick:(danMuButtonBlock)danMuButtonBlock withSenComment:(senComment)senComment
{
    self.shareButtonBlock = shareButtonBlock;
    
    self.CollectionButtonBlock = CollectionButtonBlock;
    
    self.danMuButtonBlock = danMuButtonBlock;
    
    self.sencomment = senComment;
}

@end
