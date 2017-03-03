//
//  YKBottomView.m
//  demo
//
//  Created by Eric.Wu on 17/2/20.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YKBottomView.h"
#import "model.h"

@interface YKBottomView ()

@property (weak, nonatomic) IBOutlet UIButton *btn;


@end
@implementation YKBottomView

+ (instancetype)bottomView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YKBottomView" owner:nil options:nil] lastObject];
}

//点击下一步按钮
- (IBAction)clickBtn:(id)sender
{
    if (self.selectCount > 0) {
        self.clickNextStep();
    }
    
}

- (void)bottomViewWithClickNextStep:(clickNextStep)clickNextStep
{
    self.clickNextStep = clickNextStep;
}
- (void)setSelectCount:(int)selectCount
{
    _selectCount = selectCount;
   
    if (selectCount > 0) {
        [self.btn setTitle:@"下一步" forState:UIControlStateNormal];
    }else{
          [self.btn setTitle:@"选择你的生活方式" forState:UIControlStateNormal];
    }
}

@end
