//
//  MeHeadView.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/20.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeHeadView : UIView
@property (weak, nonatomic) IBOutlet UIView *sunview;//动画
@property (weak, nonatomic) IBOutlet UIButton *sunButton;
@property (weak, nonatomic) IBOutlet UIView *gifView;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;//头像
@property (weak, nonatomic) IBOutlet UIButton *setButton;//设置
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//昵称
@property (weak, nonatomic) IBOutlet UILabel *integralLabel;//积分
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;//余额
@property (weak, nonatomic) IBOutlet UILabel *signLabel;// 签到
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;//签到得分
@property (weak, nonatomic) IBOutlet UIView *headTierView;

@end
