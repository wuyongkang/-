//
//  YX_IntrectChildComBottomView.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YX_IntrectInputAccessView;

typedef void (^SenCommentBlock)();

@interface YX_IntrectChildComBottomView : UIView

@property (weak, nonatomic) IBOutlet UITextView *CommentTextView;

@property (nonatomic,strong)  YX_IntrectInputAccessView *AccessView;

+ (instancetype)IntrectChildComBottomView;


@property (nonatomic,copy) SenCommentBlock sendBlock;

- (void)clickSenCommentBlock:(SenCommentBlock)senBlock;

@end
