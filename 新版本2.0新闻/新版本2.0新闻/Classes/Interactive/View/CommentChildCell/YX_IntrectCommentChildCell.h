//
//  YX_IntrectCommentChildCell.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YX_intrectChildListModel;
typedef void (^zanBtnClick)(YX_intrectChildListModel *model);

typedef void(^replyBtnClick)(YX_intrectChildListModel *model);


@interface YX_IntrectCommentChildCell : UITableViewCell

@property (nonatomic,strong) YX_intrectChildListModel *
    model;
// 父评论
@property (nonatomic,copy) NSString *parent_name;

@property (nonatomic,copy) zanBtnClick zanBtnClick;

@property (nonatomic,copy) replyBtnClick replyBtnClick;

- (void)DidCommentChildBtnWithzanBtnClick:(zanBtnClick)zanBtnClick replyBtnClick:(replyBtnClick)replyBtnClick;

@end
