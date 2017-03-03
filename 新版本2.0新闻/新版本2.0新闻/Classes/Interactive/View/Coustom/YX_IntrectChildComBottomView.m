//
//  YX_IntrectChildComBottomView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectChildComBottomView.h"
#import "YX_IntrectInputAccessView.h"
#import "UITextView+KCExtension.h"
//#import "<#header#>"
@interface YX_IntrectChildComBottomView ()<UITextViewDelegate>

@end
@implementation YX_IntrectChildComBottomView

+ (instancetype)IntrectChildComBottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YX_IntrectChildComBottomView" owner:nil options:nil] lastObject];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    [self.CommentTextField resignFirstResponder];
    [self.AccessView.textView becomeFirstResponder];
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.AccessView.textView becomeFirstResponder];
}
//收起键盘并发送评论

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        self.sendBlock();
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
    
    
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.CommentTextView.delegate = self;
    self.CommentTextView.backgroundColor = [UIColor clearColor];
    self.CommentTextView.kc_placeholder = @"回复评论";
    self.CommentTextView.kc_placeholderColor = [UIColor grayColor];
    self.CommentTextView.returnKeyType = UIReturnKeySend;
}
#pragma mark - clickSenCommentBlock
- (void)clickSenCommentBlock:(SenCommentBlock)senBlock
{
    self.sendBlock = senBlock;
}

- (YX_IntrectInputAccessView *)AccessView
{
    if (!_AccessView ) {
        _AccessView = [YX_IntrectInputAccessView IntrectInputAccessView];
    }
    return _AccessView;
}

@end
