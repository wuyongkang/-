//
//  YXDanMuViewController.m
//  新版本2.0新闻
//
//  Created by Eric.Wu on 17/2/8.
//  Copyright © 2017年 广州伊秀科技有限公司. All rights reserved.
//

#import "YXDanMuViewController.h"
#import "KYBarrageKit.h"
#import "YX_IntrectDetailCellFrameModel.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectDeatilHModel.h"
#import "YX_IntrectDetailModel.h"
// 分类
#import "UIButton+Bubbling.h"
@interface YXDanMuViewController ()<KYBarrageManagerDelegate>

@property (strong, nonatomic) KYBarrageManager *manager;

@property (nonatomic,assign) NSInteger Index;

// 弹幕
@property (strong,nonatomic) UIButton *bubbeBtn;

@property (strong,nonatomic) NSArray *images;
@end

@implementation YXDanMuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [KYBarrageManager manager];
    _manager.bindingView = self.view;
        
    _manager.delegate = self;
    _manager.scrollSpeed = 70;
    _manager.memoryMode = KYBarrageMemoryWarningModeHalf;
    _manager.refreshInterval = 2.0;
    _manager.scrollDirection = KYBarrageScrollDirectRightToLeft;
    _manager.displayLocation = KYBarrageDisplayLocationTypeBottom;
    
    [_manager startScroll];
    
    [self setDanMuImages];
}
- (void)setDanMuImages
{
    _images = @[@"ic_menu_bluepig",
                @"ic_menu_bluepig2",
                @"ic_menu_greenpig",
                @"ic_menu_greenpig2",
                @"ic_menu_pinkpig",
                @"ic_menu_pinkpig2",
                @"ic_menu_purplepig",
                @"ic_menu_purplepig2",
                @"ic_menu_yellowpig",
                @"ic_menu_yellowpig2"];
}

#pragma mark - BarrageManagerDelegate
- (id)barrageManagerDataSource {
    if (_Index > self.commentList.count - 1) {
        _Index  = 0;
    }
    YX_IntrectDetailCellFrameModel *FrameModel = self.commentList[_Index];
    YX_IntrectCommentModel *model = FrameModel.model;
  
    NSString *str = [NSString stringWithFormat:@"%@👍%zd",model.content,model.support];
    
    
    KYBarrageModel *m = [[KYBarrageModel alloc] initWithBarrageContent:str];
    m.displayLocation = _manager.displayLocation;
    m.direction       = _manager.scrollDirection;
    m.barrageType = KYBarrageDisplayTypeImage;
    
    KYBarrageUserModel *barrageUser = [[KYBarrageUserModel  alloc] init];
    barrageUser.url = model.portrait_url;
    m.barrageUser = barrageUser;
    m.iconURL = [NSString stringWithFormat:@"%@",model.portrait_url];
    
    m.model = model;
    // m.object     = model.img_url;
    self.Index++;
    
    return m;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.view];
    [[_manager barrageScenes] enumerateObjectsUsingBlock:^(KYBarrageScene * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.layer.presentationLayer hitTest:touchPoint]) {
            /* if barrage's type is ` KYBarrageDisplayTypeVote ` or `KYBarrageDisplayTypeImage`, add your code here*/
            UIButton *button = obj.titleLabel;
            
            YX_IntrectCommentModel *model = obj.model.model;
            if (model.user_support == 0) {
                NSString *str = [NSString stringWithFormat:@"%@👍%zd",model.content,model.support + 1];
                [button setTitle:str forState:UIControlStateNormal];
                model.user_support = 1;
                [button sizeToFit];
                model.support++;
               
            }
            
            self.danMuClick(obj.model.model,touchPoint);
          
        }
    }];
}

#pragma mark - 发送一条弹幕
- (void)sendBarrage
{
    KYBarrageModel *m = [[KYBarrageModel alloc] initWithBarrageContent:self.content];
    m.displayLocation = _manager.displayLocation;
    m.direction       = _manager.scrollDirection;
    m.barrageType = KYBarrageDisplayTypeCustomView;
    KYBarrageUserModel *barrageUser = [[KYBarrageUserModel  alloc] init];
    barrageUser.userId  = 1001;
    barrageUser.name    = @"kingly09";
    barrageUser.txt     = @"comeing";
    YX_IntrectDeatilHModel *model = self.DetailModel.detail;
    barrageUser.url     = model.img_url;
    barrageUser.vipFrom = arc4random() % 2 == 1?1:0;
    barrageUser.vip     = 1;
    
    m.barrageUser = barrageUser;
    
    [_manager showBarrageWithDataSource:m];
    
}

- (void)DidclickDanMu:(danMuClick)danMuClick
{
    self.danMuClick = danMuClick;
}
- (void)setCommentList:(NSMutableArray *)commentList
{

    _commentList = commentList;
    
}

- (void)setContent:(NSString *)content
{
    _content = content;
    
    [self sendBarrage];
}

#pragma mark - getter
- (UIButton *)bubbeBtn
{
    if (!_bubbeBtn) {
        _bubbeBtn = [[UIButton alloc] init];
        [self.view addSubview:_bubbeBtn];
        
    }
    return _bubbeBtn;
}
@end
