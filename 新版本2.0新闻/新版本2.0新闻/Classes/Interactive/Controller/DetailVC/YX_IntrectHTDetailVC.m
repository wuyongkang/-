//
//  YX_IntrectHTDetailVC.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/13.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectHTDetailVC.h"
#import "YXGameInstructionVC.h"
#import "YX_IntrectCommentDetailVC.h"
#import "YXDanMuViewController.h"
#import "YXIntrectProtocoVC.h"
//view
#import "YX_InteractDetailCell.h"
#import "YXIntrectViewDetailView.h"
#import "YX_IntertractBottomV.h"
#import "YX_IntrectCommentCell.h"
#import "YX_IntrctCommentToolView.h"
// model
#import "YX_IntrectCommentChildModel.h"
#import "YX_IntrectDetailModel.h"
#import "YX_IntrectDeatilHModel.h"
#import "YX_IntrectCommentModel.h"
#import "YX_IntrectDetailCellFrameModel.h"
#import "YX_InteractEmptyView.h"
// 第三方
#import <UShareUI/UShareUI.h>

// 分类
#import "UIButton+Bubbling.h"

#define kHeight 133
#define KBottomHeight 49

@interface YX_IntrectHTDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) YXDanMuViewController *danMuVC;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) YX_IntertractBottomV *bottomView;
// 详情model
@property (nonatomic,strong) YX_IntrectDetailModel *DetailModel;
// 头部view
@property (nonatomic,strong) YXIntrectViewDetailView *IntrectViewDetailView ;

@property (nonatomic,strong) NSMutableArray *commentList;

@property (nonatomic,assign) NSInteger BottomHeight;

// 弹幕
@property (strong,nonatomic) UIButton *bubbeBtn;

@property (strong,nonatomic) NSArray *images;

@end

@implementation YX_IntrectHTDetailVC
CGFloat height = 0;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    //  [_manager closeBarrage];
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNav];
    
    [self setDanMuImages];
 
    [self setupUI];
    
    [self setUpBottomView];
    
    [self loadCommentList];
    
    
}

#pragma mark - 
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

#pragma mark - setupUI
- (void)setupUI
{
    [self.view addSubview:self.tableView];

    [self.tableView registerClass:[YX_IntrectCommentCell class] forCellReuseIdentifier:Identifier];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kHeight, 0, 200, 0);

    YXIntrectViewDetailView *IntrectViewDetailView = [YXIntrectViewDetailView IntrectViewDetailView];
    self.IntrectViewDetailView  = IntrectViewDetailView;
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    IntrectViewDetailView.frame = CGRectMake(0, 0, YX_ScreenWidth, kHeight);
    
    IntrectViewDetailView.tag = 101;
    IntrectViewDetailView.model = self.model;
    [self.tableView addSubview:IntrectViewDetailView];
    _bubbeBtn = [[UIButton alloc] init];
    _bubbeBtn.frame = CGRectMake(YX_ScreenWidth/2, YX_ScreenHeight - 149, 10, 10);
    [self.view addSubview:_bubbeBtn];
}

#pragma mark - 设置bottomview
- (void)setUpBottomView
{
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@49);
    }];
    self.BottomHeight = KBottomHeight;

    [self.bottomView shareWithShareButtonBlock:^{
        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
            //            // 根据获取的platformType确定所选平台进行下一步操作
            [weakSelf shareTextToPlatformType:platformType];
             }];
    } WithCollectionButtonBlock:^{

        [weakSelf.navigationController pushViewController:[YXIntrectProtocoVC new] animated:YES];
    } WithTanMuButtonClick:^(UIButton *button) {
        if (button.selected == YES) {
            
            self.danMuVC.view.hidden = YES;
        }else{
            self.danMuVC.view.hidden = NO;
            
        }
    } withSenComment:^{
            [weakSelf textChanged];
            [weakSelf senComment];
            [weakSelf.bottomView.inputTextField resignFirstResponder];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextViewTextDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keybordKeyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

//分享文本
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    YX_IntrectDeatilHModel *model = self.DetailModel.detail;

    NSData *data = [NSData dataWithContentsOfURL:model.img_url];
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:model.share_title descr:model.intro thumImage:data];
    //设置网页地址
    shareObject.webpageUrl = model.share_url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;

                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        //[self alertWithError:error];
    }];
}

- (void)textChanged
{
    CGFloat margin = 179;
    CGSize maxSize = CGSizeMake(YX_ScreenWidth - margin, MAXFLOAT);
    
    CGSize size = [self.bottomView.inputTextField.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    CGFloat height = size.height + 24;
   
    if (size.height > 21) {
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@(height));
        }];
        [self.view layoutIfNeeded];
    }else{
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@(KBottomHeight));
        }];
        [self.view layoutIfNeeded];
    }
}

#pragma mark - 监听键盘弹出
- (void)keybordKeyboardWasShown:(NSNotification *)noti
{
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    //动画
    [UIView animateWithDuration:duration animations:^{
        CGRect keyBoarF = [noti.userInfo [UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyBoarF.size.height;
        self.bottomView.transform = CGAffineTransformMakeTranslation(0, -keyboardH);
    } ];

}
#pragma mark - 监听键盘隐藏
- (void)keyboardWillBeHidden:(NSNotification *)noti
{
    
    // 弹出键盘需要的时间
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        self.bottomView.transform = CGAffineTransformIdentity;
    }];
}
#pragma mark - 发送评论
- (void)senComment
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[@"hd_id"] = self.ID;
    NSString *content = self.bottomView.inputTextField.text;
    dict[@"content"] = self.bottomView.inputTextField.text;

   [[YXNetworkTool shareNetworkTool] POST:@"interact/chat_comment_add" parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        YX_BaseModel *model = [YX_BaseModel mj_objectWithKeyValues:responseObject];
        
        self.bottomView.inputTextField.text = nil;
    
        if (model.error == 0) {
            [self loadCommentList];
            self.danMuVC.content = content;
            
            //self.danMuVC.commentList
        }else{
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mak -点击游戏说明
- (void)gameInstruction
{
    YXGameInstructionVC *VC = [[YXGameInstructionVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark  - 加载评论列表
- (void)loadCommentList
{
   NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"id"] = self.ID;
    
    NSString *url = [NSString stringWithFormat:@"http://test-newsapi.yxlady.com/v2/hd/common/%@/0.json",self.ID];
    [self showProgress:@"正在加载评论"];
    [[YXNetworkTool GetShareNetworkTool] GET:url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hideProgress];
        [self.commentList removeAllObjects];
        YX_IntrectDetailModel *model = [YX_IntrectDetailModel mj_objectWithKeyValues:responseObject];
        
        NSArray *array = [self arrayWithIntrectCommetList:model.comment];
        
        [self.commentList addObjectsFromArray:array];
        
        self.DetailModel = model;
        
        if (self.commentList.count == 0) {
                height = 230;
        }else{
            [self setupRefresh];
            if (model.hasNext == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }

        [self.tableView reloadData];
        if (!self.commentList.count)return ;
    
        self.danMuVC.commentList = self.commentList;
        [self addChildViewController:self.danMuVC];
        [self.view addSubview:self.danMuVC.view];
        [self.danMuVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom).offset(-49);
            make.height.equalTo(@100);
        }];
        [self.danMuVC DidclickDanMu:^(YX_IntrectCommentModel *model,CGPoint Point) {
            self.bubbeBtn.x = Point.x;
            self.bubbeBtn.y = YX_ScreenHeight - 149 + Point.y;
            [self.bubbeBtn bubbingImage:[UIImage imageNamed:@"love"]];
            [self.bubbeBtn bubbingImages:_images];
            
            if (model.user_support == 0) {
                [self dianzan:model];

            }
        }];
        self.danMuVC.view.backgroundColor = [UIColor clearColor];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hideProgress];
    }];
}


#pragma mark - 评论列表
- (NSArray *)arrayWithIntrectCommetList:(NSArray *)list
{
    NSMutableArray *array = [NSMutableArray array];
    for (YX_IntrectCommentModel *model in list) {
        YX_IntrectDetailCellFrameModel *FrameModel = [[YX_IntrectDetailCellFrameModel alloc] init];
        FrameModel.model = model;
        
        [array addObject:FrameModel];
    }
    return array;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.bottomView.inputTextField resignFirstResponder];
}

#pragma mark - 设置刷新
- (void)setupRefresh
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self checkMoreData];
    }];
}
#pragma mark - 检查更多数据
- (void)checkMoreData
{
    if (self.DetailModel.hasNext == 0) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self loadMoreDatas];
    }
}

#pragma mark - 加载更多评论
- (void)loadMoreDatas
{
    [[YXNetworkTool GetShareNetworkTool] GET:self.DetailModel.nextUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YX_IntrectDetailModel *model = [YX_IntrectDetailModel mj_objectWithKeyValues:responseObject];
        
        NSArray *array = [self arrayWithIntrectCommetList:model.comment];
        
        [self.commentList addObjectsFromArray:array];
        
        self.DetailModel = model;
        self.danMuVC.commentList = self.commentList;
        
        [self.tableView.mj_footer endRefreshing];
        if (model.hasNext == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark - datasure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    YX_IntrectCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
//    cell.textLabel.text = @"jj";
    YX_IntrectDetailCellFrameModel *FrameModel = self.commentList[indexPath.row];
    cell.model = FrameModel;
    
    [cell.toolView DidCommentCellBtnWithzanBtnClick:^(YX_IntrectCommentModel *model) {
//        YXLog(@"%@",model);
        [weakSelf dianzan:model];
    } commentBtnClick:^{
        
    [weakSelf tiaozhuanVCWithModel:FrameModel.model];

    } shareBtnClick:^{
        
    }];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YX_IntrectDetailCellFrameModel *model = self.commentList[indexPath.row];

    return model.height;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.commentList.count == 0) {
        
        return height;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [YX_InteractEmptyView InteractEmptyView];
}

#pragma mark - 点赞
- (void)dianzan:(YX_IntrectCommentModel *)model
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"comment_id"] = model.ID;
    dict[@"hd_id"] = self.ID;
    
    [[YXNetworkTool shareNetworkTool] POST:@"interact/chat_support" parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        [self.tableView reloadData];
        
        YX_BaseModel *BaseModel = [YX_BaseModel mj_objectWithKeyValues:responseObject];
        if (BaseModel.error == 0) {
            //            MBProgressHUD
            model.support++;
            model.user_support = 1;
            self.danMuVC.commentList = self.commentList;
            [self.tableView reloadData];
        }else if(BaseModel.error == -1){
             model.user_support = 1;
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    tableView
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    YX_IntrectDetailCellFrameModel *FrameModel = self.commentList[indexPath.row];
    
    [self tiaozhuanVCWithModel:FrameModel.model];
   
}
#pragma mark =- 跳转到下一级控制器
- (void)tiaozhuanVCWithModel:(YX_IntrectCommentModel*)model
{
     YX_IntrectCommentDetailVC *vc = [[YX_IntrectCommentDetailVC alloc] init];
    vc.model = model;
    vc.ID = self.ID;
    vc.commentID = model.ID;
    [self.bottomView.inputTextField resignFirstResponder];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < - kHeight) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        
        rect.size.width = -point.y;
        if (rect.size.width < YX_ScreenWidth) {
            rect.size.width = YX_ScreenWidth;
        }
        [self.tableView viewWithTag:101].frame = rect;
    }
    
    [self.view resignFirstResponder];
}
#pragma mark -设置右边按钮
- (void)setNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"" highImageName:@"" target:self action:@selector(rightBarButtonItemClick)];
}

- (void)rightBarButtonItemClick
{
    
}

#pragma mark - setter
- (void)setID:(NSString *)ID
{
    _ID = [ID copy];
}

- (void)setModel:(YX_IntrectZTModel *)model
{
    _model = model;
}

#pragma mark -getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, YX_ScreenWidth, YX_ScreenHeight - KBottomHeight - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
    
}

- (YX_IntertractBottomV *)bottomView
{
    if (!_bottomView ) {
        _bottomView = [YX_IntertractBottomV intertractBottomView];
    }
    return _bottomView;
}
- (NSMutableArray *)commentList
{
    if (!_commentList ) {
        _commentList = [NSMutableArray array];
    }
    return _commentList;
}

- (YXDanMuViewController *)danMuVC
{
    if (!_danMuVC ) {
        _danMuVC = [[YXDanMuViewController alloc] init];
        
    }
    return _danMuVC;
}
- (UIButton *)bubbeBtn
{
    if (!_bubbeBtn) {
        _bubbeBtn = [[UIButton alloc] init];
        [self.view addSubview:_bubbeBtn];
    }
    return _bubbeBtn;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
  
}
@end
