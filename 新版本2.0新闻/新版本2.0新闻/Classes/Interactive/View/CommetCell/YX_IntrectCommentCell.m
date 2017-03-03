//
//  YX_IntrectCommentCell.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentCell.h"
#import "YX_IntrectDetailCellFrameModel.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectCommentHView.h"
#import "YX_IntrectCommentHFrame.h"
#import "YX_IntrctCommentToolView.h"
#import "YX_IntrectComentToolFrame.h"
#import "YX_ChildCommentView.h"
#import "YX_IntrectCommentChilFrame.h"
#import "YX_ChildCommentView.h"
#import "YX_IntrectCommentChildModel.h"
@interface  YX_IntrectCommentCell ()

@property (nonatomic,strong) YX_IntrectCommentHView *CommentHView ;



@property (nonatomic,strong) YX_ChildCommentView *childCommentView;

@end

@implementation YX_IntrectCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.CommentHView];
        
        [self.contentView addSubview:self.toolView];
        
        [self.contentView addSubview:self.childCommentView];
       
    }
    
    return self;
}

- (void)setModel:(YX_IntrectDetailCellFrameModel *)model
{
    _model = model;
    
    [self setupCommentHView];
    
    [self setupCommentToolView];
    [self setupChildCommentView];
     YX_IntrectCommentChildModel *childModel = model.model.child;
    if (childModel.list.count) {
        self.childCommentView.hidden = NO;
        
    }else{
        self.childCommentView.hidden = YES;
    }
}

- (void)setupCommentHView
{

    self.CommentHView.FrameModel = self.model.commentHFrame;
    
    self.CommentHView.frame  = self.model.commentHFrame.frame;

}

- (void)setupCommentToolView
{
    self.toolView.toolFrame = self.model.comentToolFrame;
    
    self.toolView.frame = self.model.comentToolFrame.frame;
    
}

- (void)setupChildCommentView
{
    self.childCommentView.frameModel = self.model.commentChilFrame;
    self.childCommentView.frame = self.model.commentChilFrame.frame;
}


- (YX_IntrectCommentHView *)CommentHView
{
    if (!_CommentHView ) {
        _CommentHView = [[YX_IntrectCommentHView alloc] init];
    }
    return _CommentHView;
}

- (YX_IntrctCommentToolView *)toolView
{
    if (!_toolView ) {
        _toolView = [YX_IntrctCommentToolView IntrctCommentToolView];
    }
    return _toolView;
}
- (YX_ChildCommentView *)childCommentView
{
    if (!_childCommentView ) {
        _childCommentView = [[YX_ChildCommentView alloc] init];
    }
    return _childCommentView;
}


@end
