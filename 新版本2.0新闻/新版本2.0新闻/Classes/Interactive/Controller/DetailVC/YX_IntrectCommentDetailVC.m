//
//  YX_IntrectCommentDetailVC.m
//  YXNews
//
//  Created by Eric.Wu on 17/1/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "YX_IntrectCommentDetailVC.h"

// model
#import "YX_IntrectCommentChildModel.h"
#import "YX_IntrectCommentModel.h"
#import "YX_intrectChildListModel.h"
#import "YX_IntrectDetailModel.h"
#import "YX_CommentModel.h"
//view
#import "YX_IntrectCommentChildCell.h"
#import "YX_IntrectComChildCell.h"
#import "YX_IntrectChildComBottomView.h"
#import "YX_IntrectInputAccessView.h"
//YX_IntrectCommentChildCell
#define KBottomH  49
#define KNavigationH 64

@interface YX_IntrectCommentDetailVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) YX_IntrectCommentChildModel *ChildModel;

@property (nonatomic,strong) NSMutableArray *commentArray;

@property (nonatomic,strong) YX_IntrectChildComBottomView *bottomView;
// 点击评论子评论
@property (nonatomic,strong) YX_intrectChildListModel *ChildListModel;
//评论模型
@property (nonatomic,strong) YX_CommentModel *CommentModel;



@end

@implementation YX_IntrectCommentDetailVC

static NSString *const ChildIdentifier = @"ChildIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupUI];
    
    [self ReceiveNotifications];
    
    [self loadCommment];
    
    [self setupRefresh];
}

#pragma mark - 加载子评论
- (void)loadCommment
{
    
    NSString *url = [NSString stringWithFormat:@"http://test-newsapi.yxlady.com/v2/hd/chat_child_comment/%@/%@/0.json",self.ID,self.commentID];
    [self showProgress:@"正在加载"];
    [[YXNetworkTool GetShareNetworkTool] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.commentArray removeAllObjects];
         YX_CommentModel *model = [YX_CommentModel mj_objectWithKeyValues:responseObject];
        
        self.CommentModel = model;
        
        [self.commentArray addObjectsFromArray:model.list];
        [self.tableView reloadData];
        if (model.hasNext == 1) {
             self.tableView.mj_footer.hidden = NO;
        }
        [self hideProgress];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [self hideProgress];
    }];
}

#pragma mark - 设置刷新控件
- (void)setupRefresh
{
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self checkMoreData];
    }];
    self.tableView.mj_footer.hidden = YES;
}

#pragma mark - 检查更多数据
- (void)checkMoreData
{
    if (self.CommentModel.hasNext == 0) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self loadMoreDatas];
    }
}
#pragma mark - 加载更多评论
- (void)loadMoreDatas
{
    [[YXNetworkTool GetShareNetworkTool] GET:self.CommentModel.nextUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YX_CommentModel *model = [YX_CommentModel mj_objectWithKeyValues:responseObject];
        
        self.CommentModel = model;
        
        [self.commentArray addObjectsFromArray:model.list];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark -监听键盘通知
- (void)ReceiveNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextViewTextDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keybordKeyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
  
}

#pragma mark - setupUI
- (void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"YX_IntrectCommentChildCell" bundle:nil] forCellReuseIdentifier:Identifier];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YX_IntrectComChildCell" bundle:nil] forCellReuseIdentifier:ChildIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 106;
    

    self.view.backgroundColor = YX_RGBColor(248, 247, 247);
    [self.view addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@49);
    }];
    
   
    [self.bottomView clickSenCommentBlock:^{
        
        [self senComment];
        
    }];
}

- (void)textChanged
{
    
    CGFloat margin = 32;
    CGSize maxSize = CGSizeMake(YX_ScreenWidth - margin, MAXFLOAT);
    
    CGSize size = [self.bottomView.CommentTextView.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
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
            make.height.equalTo(@(KBottomH));
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

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        YX_IntrectComChildCell *cell = [tableView dequeueReusableCellWithIdentifier:ChildIdentifier   forIndexPath:indexPath];

        cell.model = self.commentArray[indexPath.row];
        
        return cell;
    }else{
    YX_IntrectCommentChildCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
        cell.model = self.commentArray[indexPath.row];
    YX_intrectChildListModel *model = self.commentArray[0];
    cell.parent_name = model.user_name;
   [cell DidCommentChildBtnWithzanBtnClick:^(YX_intrectChildListModel *model) {
       
       [self dianZan:model];
       
       
   } replyBtnClick:^(YX_intrectChildListModel *model) {
       
       self.ChildListModel = model;
       
       [self.bottomView.CommentTextView becomeFirstResponder];
       
   }];

         return cell;
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.bottomView.CommentTextView resignFirstResponder];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
   }


#pragma mark - 拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.bottomView.CommentTextView resignFirstResponder];
}

#pragma mark - 发送评论
- (void)senComment
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (!self.ChildListModel) {
        dict[@"top_id"] = self.model.ID;
        dict[@"parent_user_name"] = self.model.user_name;
        dict[@"parent_user_id"] = self.model.user_id;
        dict[@"parent_id"] = self.model.ID;
    }else{
        dict[@"parent_user_name"] = self.ChildListModel.user_name;
        dict[@"top_id"] = self.ChildListModel.top_id;
        dict[@"parent_id"] = self.ChildListModel.ID;
        dict[@"parent_user_id"] = self.ChildListModel.user_id;
        
    }
     dict[@"hd_id"] = self.ID;
        dict[@"content"] = self.bottomView.CommentTextView.text;

    [[YXNetworkTool shareNetworkTool] POST:@"interact/chat_comment_add" parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        self.bottomView.CommentTextView.text = nil;
        [self.bottomView.CommentTextView resignFirstResponder];
    
        YX_BaseModel *model = [YX_BaseModel mj_objectWithKeyValues:responseObject];
        if (model.error == 0) {
            [self showAlert:model.msg];
            [self loadCommment];
            self.ChildListModel = nil;
        }else{
            [self showAlert:model.msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
#pragma mark - 点赞
- (void)dianZan:(YX_intrectChildListModel *)model
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"comment_id"] = model.ID;
    dict[@"hd_id"] = self.ID;

    [[YXNetworkTool shareNetworkTool] POST:@"interact/chat_support" parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        YXLog(@"%@",responseObject);
        YX_BaseModel *model = [YX_BaseModel mj_objectWithKeyValues:responseObject];
        if (model.error == 0) {
//            MBProgressHUD
           
        }else{
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
#pragma mark -setter
 - (void)setModel:(YX_IntrectCommentModel *)model
{
    _model = model;
    
    self.ChildModel = model.child;
    
//    [self setupArrayWithModel:model];
    
}
- (void)setCommentID:(NSString *)commentID
{
    _commentID = commentID;
}
#pragma mark - getter
- (UITableView *)tableView
{
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, YX_ScreenWidth, YX_ScreenHeight  - KBottomH ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
    
}
- (NSMutableArray *)commentArray
{
    if (!_commentArray ) {
        _commentArray = [NSMutableArray array];
    }
    return _commentArray;
}

- (YX_IntrectChildComBottomView *)bottomView
{
    if (!_bottomView ) {
        _bottomView = [YX_IntrectChildComBottomView IntrectChildComBottomView];
        
    }
    return _bottomView;
}

@end
