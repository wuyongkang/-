//
//  YX_IntertractBottomV.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/4.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ShareButtonBlock)();

typedef void (^CollectionButtonBlock)();

typedef void (^danMuButtonBlock)(UIButton *button);

typedef void (^senComment)();
@interface YX_IntertractBottomV : UIView

@property (nonatomic,copy) ShareButtonBlock shareButtonBlock;

@property (weak, nonatomic) IBOutlet UITextView *inputTextField;

@property (nonatomic,copy) CollectionButtonBlock CollectionButtonBlock;

@property (nonatomic,copy) danMuButtonBlock danMuButtonBlock;

@property (nonatomic,copy) senComment sencomment;

+ (instancetype)intertractBottomView;

- (void)shareWithShareButtonBlock:(ShareButtonBlock)shareButtonBlock WithCollectionButtonBlock:(CollectionButtonBlock)CollectionButtonBlock WithTanMuButtonClick:(danMuButtonBlock)danMuButtonBlock withSenComment:(senComment)senComment;

@end
