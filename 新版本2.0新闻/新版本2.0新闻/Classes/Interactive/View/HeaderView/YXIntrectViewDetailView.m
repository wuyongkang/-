//
//  YXIntrectViewDetailView.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/13.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YXIntrectViewDetailView.h"
#import "YX_IntrectZTModel.h"
@interface YXIntrectViewDetailView ()
@property (weak, nonatomic) IBOutlet UILabel *ZTLabel;
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic,assign) NSInteger timeSp1;

@end
@implementation YXIntrectViewDetailView

+ (instancetype)IntrectViewDetailView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YXIntrectViewDetailView" owner:nil options:nil]lastObject];
}

- (void)setModel:(YX_IntrectZTModel *)model
{
    _model = model;
    
    [self.bgImageView sd_setImageWithURL:model.img_url];
    self.ZTLabel.text = model.title;
    self.ContentLabel.text = model.intro;
    self.countLabel.text = [NSString stringWithFormat:@"已有%zd人参加",model.join_count];
    
    NSDate *dateStr = [NSDate dateWithTimeIntervalSince1970:[model.end_time integerValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [formatter stringFromDate:dateStr];
    if (model.state == 1) {
        self.timeLabel.text = [NSString stringWithFormat:@" 截止时间:%@ ",dateString];
    }else{
        self.timeLabel.font = [UIFont systemFontOfSize:16];
        self.timeLabel.text = [NSString stringWithFormat:@"  活动已结束  "];
    }

   }

- (void)TopicTimeWithCreatTime:(NSString *)CreatTime endTime:(NSString *)endtime
{
    //设置答题剩余时间

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSDate* date = [formatter dateFromString:endtime];
    
    //把时间转化成时间戳
    int timeSp1 =  [date timeIntervalSince1970];
    self.timeSp1 = timeSp1;
    self.timeLabel.text = [NSString stringWithFormat:@"剩余时间 %d",timeSp1];
    
}

#pragma mark - awakeFromNib
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.bgImageView.layer.masksToBounds = YES;
    
    self.timeLabel.layer.cornerRadius = 3;
    self.timeLabel.layer.masksToBounds = YES;
    
}


@end
