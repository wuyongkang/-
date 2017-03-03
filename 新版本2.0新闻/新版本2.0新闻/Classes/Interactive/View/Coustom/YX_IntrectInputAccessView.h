//
//  YX_IntrectInputAccessView.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/20.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YX_IntrectInputAccessView : UIView

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *completedBtn;

+ (instancetype)IntrectInputAccessView;
@end
