//
//  YX_IntrctCommentToolView.h
//  YXNews
//
//  Created by Eric.Wu on 17/1/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YX_IntrectComentToolFrame,YX_IntrectCommentModel;

typedef void (^zanBtnClick)(YX_IntrectCommentModel *model);

typedef void (^commentBtnClick)();


typedef void (^shareBtnClick)();


@interface YX_IntrctCommentToolView : UIView

+ (instancetype)IntrctCommentToolView;

@property (nonatomic,strong) YX_IntrectComentToolFrame *toolFrame;

@property (nonatomic,copy) zanBtnClick zanBtnClick;

@property (nonatomic,copy) commentBtnClick commentBtnClick;

@property (nonatomic,copy) shareBtnClick shareBtnClick;

- (void)DidCommentCellBtnWithzanBtnClick:(zanBtnClick)zanBtnClick commentBtnClick:(commentBtnClick)commentBtnClick shareBtnClick:(shareBtnClick)shareBtnClick;
@end
