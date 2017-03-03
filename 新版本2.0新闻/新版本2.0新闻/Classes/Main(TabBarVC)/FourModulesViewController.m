//
//  FourModulesViewController.m
//  新版本2.0新闻
//
//  Created by 李元喜 on 16/12/12.
//  Copyright © 2016年 广州伊秀科技有限公司. All rights reserved.
//

#import "FourModulesViewController.h"
#import "YXGIFView.h"
#import "SunCartoonView.h"
#import "MeHeadView.h"
#import "NewsViewController.h"//评论
#import "MyFavoriteViewController.h"//收藏
#import "InteractionViewController.h"//互动
#import "StoreViewController.h"//商城
#import "YXTaskCenterViewController.h"//任务中心
#import "MoneyViewController.h" //余额提现
#import "ShareView.h"//动画分享弹框
#import "YXRecommendVC.h" //推荐好友
#import "YXRuleWeb.h" //规则WEB
#import "YXSetNewsViewController.h"//设置
#import "UIButton+TopBottom.h"
#import "YXLoginViewController.h"//登录界面

@interface FourModulesViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView * tableview;
@property (nonatomic, strong) YXGIFView * gifView;
@property (nonatomic, strong) SunCartoonView * sun;
@property (nonatomic, strong) MeHeadView * meHeadview;
@property (nonatomic, strong) UIView * Bow;
@property (nonatomic, strong) UIView * headView;
@property (nonatomic, strong) UIView * oneView;   //分区一
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) NSArray * weekArray;//签到图classify
@property (nonatomic, strong) NSArray * weektitleArray;//签到图classify

@property (nonatomic, strong) NSArray * classifyArray;//分区图
@property (nonatomic, strong) NSArray * classifytitleArray;//分区图
@property (nonatomic, strong) NSArray * zoneTitleArray;//分区名
@property (nonatomic, strong) NSArray * zoneImageArray;//分区图

@end

@implementation FourModulesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSource];
    [self loadHeadView];
    [self loadtableview];
    
    UIColor *testColor1= [UIColor colorWithRed:2/255.0 green:174/255.0 blue:236/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = testColor1;
    self.navigationController.delegate = self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadGlobalView) name:@"loadGlobalView" object:nil];
    
}

#pragma - mark - 私有方法 通知
-(void)loadGlobalView{
    
    [self LoginData];
}

-(void)LoginData{
    
    NSLog(@"image ---- %@",YXNewsUser.m_portrait_url);
    NSLog(@"name ---- %@",YXNewsUser.m_nickname);
    if (![YXNewsUser isLogin]) {
        self.meHeadview.nameLabel.text = @"点击登录";
        [self.meHeadview.headImage setImage:[UIImage imageNamed:@"profile_icon"]];
        
    }else{
        
        self.meHeadview.nameLabel.text = YXNewsUser.m_nickname;
        [self.meHeadview.headImage sd_setImageWithURL:[NSURL URLWithString:YXNewsUser.m_portrait_url] placeholderImage:[UIImage imageNamed:@"profile_icon"]];
        
    }
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//解决空白20像素问题
-(UIStatusBarStyle)preferredStatusBarStyle

{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden

{
    return YES;
}

#pragma mark --- 分区数据
-(void)loadSource{
    
    _weekArray  = @[@"yiqiandao",@"yiqiandao",@"yiqiandao",@"yiqiandao",@"yiqiandao",@"yiqiandao",@"huoliwu"];
    _weektitleArray  = @[@"1天",@"2天",@"3天",@"4天",@"5天",@"6天",@""];
    _classifytitleArray  = @[@"消息",@"收藏",@"互动",@"商城"];
    _classifyArray  = @[@"xinxi",@"shoucang",@"shoucang",@"shangcheng"];
    _zoneTitleArray = @[@"任务中心",@"余额体现",@"推荐好友",@"积分规则",@"兑换记录"];
    _zoneImageArray = @[@"renwuzhongxin",@"tixian",@"tuijianhaoyou",@"jifenguize",@"duihuanjilu"];
    
}

#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

#pragma mark --- 隐藏导航
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark --- 注册headview
-(void)loadtableview
{
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.tableview.tableHeaderView = self.meHeadview;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.tableview];
    
}

#pragma mark --- 设置headview
-(void)loadHeadView{
    
    self.meHeadview = [[MeHeadView alloc]initWithFrame:CGRectMake(0, 0, APP_W, APP_H * 0.44)];
    self.meHeadview.headImage.layer.cornerRadius = 40;
    [ self.meHeadview.headImage.layer setMasksToBounds:YES];
    self.meHeadview.headImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topImage)];
    [ self.meHeadview.headImage addGestureRecognizer:singleTap1];
    [self.headView addSubview: self.meHeadview.headImage];
    
    [self.meHeadview.sunButton addTarget:self action:@selector(Actiondo) forControlEvents:UIControlEventTouchUpInside];
    [self.meHeadview.setButton addTarget:self action:@selector(setclick) forControlEvents:UIControlEventTouchUpInside];
    
    [self runGifTwo];
    
}
#pragma mark --- GIF背景

- (void)runGifOne {
    
    self.gifView = [[YXGIFView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.meHeadview.frame.size.height)) filePath:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]];
    [self.meHeadview.gifView addSubview:self.gifView];
    // 停止动画(移除动画先停止  节省内存)
    //            [gifView stopGif];
}

// webView(不会出现内存问题)
- (void)runGifTwo {
    
    //webView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,self.meHeadview.frame.size.width,self.meHeadview.frame.size.height)];
    webView.backgroundColor = [UIColor redColor];
    webView.scalesPageToFit = YES;
    
    [webView loadData:[self loadDataForIndex:1] MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.meHeadview.gifView addSubview:webView];
}

- (NSData *)loadDataForIndex:(NSInteger)index {
    NSData *data = nil;
    if (index == 0) {
        //网络
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://heshui-api.yxlady.com/test/xwtest.html"]];
    }else {
        //本地
        data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]];
    }
    return data;
}

#pragma mark -- tableview 下划线左边置顶
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if ([self.tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableview setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableview setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//设置区头间距
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 12;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 87;
    }
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    
    if (indexPath.section == 0) {
        if (!self.oneView) {
            self.oneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_W, 87)];
            self.oneView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [cell addSubview:self.oneView];
            
            //签到设置
            float x = (APP_W - 20*7)/14;
            
            for (int i = 0; i < 7; i++) {
                UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                signBtn.frame = CGRectMake(x + 20 *i + 2 * x * i , 0, 32, 32);
                [signBtn setBackgroundImage:[UIImage imageNamed:self.weekArray[i]] forState:UIControlStateNormal];
                [signBtn setTitle:self.weektitleArray[i] forState:UIControlStateNormal];
                [signBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                signBtn.titleLabel.font = [UIFont systemFontOfSize: 10];
                //                [signBtn setBackgroundColor:[UIColor whiteColor]];
                
                signBtn.tag = 100 + i;
                [signBtn addTarget:self action:@selector(singClick:) forControlEvents:UIControlEventTouchUpInside];
                [self.oneView addSubview:signBtn];
            }
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 32, APP_W, 1)];
            lineView.backgroundColor = [UIColor grayColor];
            [self.oneView addSubview:lineView];
            
            for (int i = 0; i < 4; i++) {
                
                UIButton *fourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                fourBtn.imageView.contentMode =  UIViewContentModeScaleAspectFill;
                
                fourBtn.frame = CGRectMake(APP_W/4 * i, CGRectGetMaxY(lineView.frame), APP_W / 4, 55);
                fourBtn.backgroundColor = [UIColor whiteColor];
                //                [fourBtn setBackgroundImage:[UIImage imageNamed:self.classifyArray[i]] forState:UIControlStateNormal];
                [fourBtn setTitle:self.classifytitleArray[i] forState:UIControlStateNormal];
                [fourBtn setImage:[UIImage imageNamed:self.classifyArray[i]] forState:UIControlStateNormal];
                [fourBtn verticalImageAndTitle:5];
                [fourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                fourBtn.titleLabel.font = [UIFont systemFontOfSize: 10];
                
                //设置Button 图片居中
                CGSize imgViewSize,titleSize,btnSize;
                
                UIEdgeInsets imageViewEdge,titleEdge;
                
                CGFloat heightSpace = 10.0f;
                
                imgViewSize = fourBtn.imageView.bounds.size;
                
                titleSize = fourBtn.titleLabel.bounds.size;
                
                btnSize = fourBtn.bounds.size;
                
                imageViewEdge = UIEdgeInsetsMake(heightSpace,0.0, btnSize.height -imgViewSize.height - heightSpace, - titleSize.width);
                
                [fourBtn setImageEdgeInsets:imageViewEdge];
                
                titleEdge = UIEdgeInsetsMake(imgViewSize.height +heightSpace, - imgViewSize.width, 0.0, 0.0);
                
                [fourBtn setTitleEdgeInsets:titleEdge];
                
                fourBtn.tag = 1000 + i;
                [fourBtn addTarget:self action:@selector(fourClick:) forControlEvents:UIControlEventTouchUpInside];
                
                [self.oneView addSubview:fourBtn];
            }
            
            for (int i = 0; i < 3; i++) {
                UIView *threeView = [[UIView alloc] initWithFrame:CGRectMake(APP_W/4 * (i+1), CGRectGetMaxY(lineView.frame) + 10, 1, 35)];
                threeView.backgroundColor = [UIColor grayColor];
                [self.oneView addSubview:threeView];
            }
        }
    }else if (indexPath.section == 1){
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;// 显示箭头
        cell.textLabel.text = self.zoneTitleArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:self.zoneImageArray[indexPath.row]];
    }
    return cell;
}

#pragma mark - 太阳动画调用
-(void)Actiondo{
    
    if (![YXNewsUser isLogin]) {
        
        [self showAlert:@"未登录"];
        
    }else{
        
    [self showAlert:@"签到成功"];
    [self heartbeatView:self.meHeadview.sunview duration:0];
    [self showTheApplauseInView:self.meHeadview.headTierView belowView:self.meHeadview.sunButton];
        
    }
}

-(void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration
{
    
    [[self class] heartbeatView:view duration:fDuration maxSize:1.3f durationPerBeat:0.5f];
    
}

#pragma mark - 调到设置界面
-(void)setclick
{
    if (![YXNewsUser isLogin]) {
        YXLoginViewController * login = [[YXLoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
        
    }else{
    
    YXSetNewsViewController * set = [[YXSetNewsViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
        
    }
}

#pragma mark - 头像事件

-(void)topImage
{
    if (![YXNewsUser isLogin]) {
        YXLoginViewController *login = [[YXLoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
        
    }else
    {
        YXSetNewsViewController * set = [[YXSetNewsViewController alloc]init];
        [self.navigationController pushViewController:set animated:YES];
    }
    
}
#pragma mrak - 签到设置

-(void)singClick:(UIButton *)button
{
    if (button.tag == 100) {
        NSLog(@"1");
    }
    if (button.tag == 101) {
        NSLog(@"2");
    }
    if (button.tag == 102) {
        NSLog(@"3");
    }
    if (button.tag == 103) {
        NSLog(@"4");
    }
    if (button.tag == 104) {
        NSLog(@"5");
    }
    if (button.tag == 105) {
        NSLog(@"6");
    }
    if (button.tag == 106) {
        NSLog(@"7");
    }
    
}


#pragma mark - 四个消息事件
- (void)fourClick:(UIButton *)button
{
    if (button.tag == 1000) {
        
        [self.navigationController pushViewController:[[NewsViewController alloc] init] animated:YES];
        
    }
    if (button.tag == 1001) {
        
        [self.navigationController pushViewController:[[MyFavoriteViewController alloc] init] animated:YES];
        
    }
    if (button.tag == 1002) {
        
        [self.navigationController pushViewController:[[InteractionViewController alloc] init] animated:YES];
        
    }
    if (button.tag == 1003) {
        
        [self.navigationController pushViewController:[[StoreViewController alloc] init] animated:YES];
        
    }
}

#pragma mark - tableview点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            
            YXTaskCenterViewController * task = [[YXTaskCenterViewController alloc]init];
            [self.navigationController pushViewController:task animated:YES];
            
        }
        if (indexPath.row == 1) {
            
            MoneyViewController *money = [[MoneyViewController alloc]init];
            [self.navigationController pushViewController:money animated:YES];
            
        }
        if (indexPath.row == 2) {
            //        NSArray*imgNameArray=@[@"tabbar_compose_camera",@"tabbar_compose_friend",@"tabbar_compose_idea",@"tabbar_compose_music",@"tabbar_compose_photo",@"tabbar_compose_more"];
            //
            //            NSArray *titleArray = @[@"相机",@"朋友",@"消息",@"音乐",@"相机",@"更多"];
            //
            //            ShareView *animationView = [[ShareView alloc] initImageNameArray:imgNameArray withItmeTitleArray:titleArray];
            //            animationView.lineItmeNunber = 3;
            //            animationView.itmeSize = CGSizeMake(100, 100);
            //            animationView.itmeTitleFont = [UIFont systemFontOfSize:15];
            //            [animationView addButtonItmeToAnimationView];
            //            [animationView showAnimationView];
            //            animationView.yyAnimationButtonItmeClick = ^( NSInteger tags){
            //                //        NSLog(@"%ld",(long)tags);
            //                if (tags == 0) {
            //                    NSLog(@"相机");
            //                }
            //                if (tags == 1) {
            //                    NSLog(@"朋友");
            //                }
            //                if (tags == 2) {
            //                    NSLog(@"消息");
            //                }
            //                if (tags == 3) {
            //                    NSLog(@"音乐");
            //                }
            //                if (tags == 4) {
            //                    NSLog(@"44");
            //                }
            //                if (tags == 5) {
            //                    NSLog(@"更多");
            //                }
            //            };
            
            YXRecommendVC *Recommend = [[YXRecommendVC alloc]init];
            [self.navigationController pushViewController:Recommend animated:YES];
        }
        if (indexPath.row == 3) {
            
            YXRuleWeb *web = [[YXRuleWeb alloc]init];
            [self.navigationController pushViewController:web animated:YES];
            
        }
        if (indexPath.row == 4) {
            NSLog(@"兑换记录");
            
        }
    }
}


+(void)heartbeatView:(UIView *)view duration:(CGFloat)fDuration maxSize:(CGFloat)fMaxSize durationPerBeat:(CGFloat)fDurationPerBeat

{
    
    if (view && (fDurationPerBeat > 0.4f))
        
    {
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        CATransform3D scale1 = CATransform3DMakeScale(0.6, 0.6, 1);
        
        CATransform3D scale2 = CATransform3DMakeScale(fMaxSize, fMaxSize, 1);
        
        CATransform3D scale3 = CATransform3DMakeScale(fMaxSize - 0.3f, fMaxSize - 0.3f, 1);
        
        CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
        
        NSArray *frameValues = [NSArray arrayWithObjects:
                                
                                [NSValue valueWithCATransform3D:scale1],
                                
                                [NSValue valueWithCATransform3D:scale2],
                                
                                [NSValue valueWithCATransform3D:scale3],
                                
                                [NSValue valueWithCATransform3D:scale4],
                                
                                nil];
        
        
        [animation setValues:frameValues];
        
        NSArray *frameTimes = [NSArray arrayWithObjects:
                               
                               [NSNumber numberWithFloat:0.05],
                               
                               [NSNumber numberWithFloat:0.2],
                               
                               [NSNumber numberWithFloat:0.6],
                               
                               [NSNumber numberWithFloat:1.0],
                               
                               nil];
        
        [animation setKeyTimes:frameTimes];
        
        animation.fillMode = kCAFillModeForwards;
        
        animation.duration = fDurationPerBeat;
        
        animation.repeatCount = fDuration/fDurationPerBeat;
        
        [view.layer addAnimation:animation forKey:@"heartbeatView"];
        
    }else{}
    
}

//动画
- (void)showTheApplauseInView:(UIView *)view belowView:(UIButton *)v{
    NSInteger index = arc4random_uniform(7); //取随机图片
    NSString *image = [NSString stringWithFormat:@"applause_%zd",index];
    UIImageView *applauseView = [[UIImageView alloc]initWithFrame:CGRectMake(APP_W / 2, APP_H / 2 - 100, 40, 40)];//增大y值可隐藏弹出动画
    [view insertSubview:applauseView belowSubview:v];
    applauseView.image = [UIImage imageNamed:image];
    
    CGFloat AnimH = 350; //动画路径高度,
    applauseView.transform = CGAffineTransformMakeScale(0, 0);
    applauseView.alpha = 0;
    
    //弹出动画
    [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        applauseView.transform = CGAffineTransformIdentity;
        applauseView.alpha = 0.9;
    } completion:NULL];
    
    //随机偏转角度
    NSInteger i = arc4random_uniform(2);
    NSInteger rotationDirection = 1- (2*i);// -1 OR 1,随机方向
    NSInteger rotationFraction = arc4random_uniform(10); //随机角度
    //图片在上升过程中旋转
    [UIView animateWithDuration:4 animations:^{
        applauseView.transform = CGAffineTransformMakeRotation(rotationDirection * M_PI/(4 + rotationFraction*0.2));
    } completion:NULL];
    
    //动画路径
    UIBezierPath *heartTravelPath = [UIBezierPath bezierPath];
    [heartTravelPath moveToPoint:applauseView.center];
    
    //随机终点
    CGFloat ViewX = applauseView.center.x;
    CGFloat ViewY = applauseView.center.y;
    CGPoint endPoint = CGPointMake(ViewX + rotationDirection*10, ViewY - AnimH);
    
    //随机control点
    NSInteger j = arc4random_uniform(2);
    NSInteger travelDirection = 1- (2*j);//随机放向 -1 OR 1
    
    NSInteger m1 = ViewX + travelDirection*(arc4random_uniform(20) + 20);
    NSInteger n1 = ViewY - 60 + travelDirection*arc4random_uniform(20);
    NSInteger m2 = ViewX - travelDirection*(arc4random_uniform(20) + 50);
    NSInteger n2 = ViewY - 90 + travelDirection*arc4random_uniform(20);
    CGPoint controlPoint1 = CGPointMake(m1, n1);//control根据自己动画想要的效果做灵活的调整
    CGPoint controlPoint2 = CGPointMake(m2, n2);
    //根据贝塞尔曲线添加动画
    [heartTravelPath addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //关键帧动画,实现整体图片位移
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = heartTravelPath.CGPath;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    keyFrameAnimation.duration = 3 ;//往上飘动画时长,可控制速度
    [applauseView.layer addAnimation:keyFrameAnimation forKey:@"positionOnPath"];
    
    //消失动画
    [UIView animateWithDuration:3 animations:^{
        applauseView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [applauseView removeFromSuperview];
    }];
}



@end
