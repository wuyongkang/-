//
//  NewsTypeTwoCell.h
//  新版本2.0新闻
//
//  Created by 李元喜 on 17/1/3.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTypeTwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *channelnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;

@end
