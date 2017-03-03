//
//  ViewController.m
//  demo
//
//  Created by Eric.Wu on 17/2/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ViewController.h"
#import "TabelViewCell.h"
#import "YKBottomView.h"
#import "GenderView.h"
#import "model.h"
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
#define bottomH 60
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tabelView;

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) model *model;

@property (nonatomic,strong) NSMutableArray *array;

@property (nonatomic,strong) YKBottomView *bottomView;

@property (nonatomic,assign) int count;

@property (nonatomic,strong) GenderView *genderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.count = 0;
    
    [self setupUI];
}

- (void)setupUI
{
    [self.view addSubview:self.bgView];
    
    self.bgView.image = [UIImage imageNamed:@"bg_guide_6_1"];
   
    self.bgView.userInteractionEnabled = YES;
    
    
    [UIView animateWithDuration:3 animations:^{
      
       
    } completion:^(BOOL finished) {
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.bgView.alpha = 1;
            self.bgView.image = [UIImage imageNamed:@"bg_guide_6_2"];
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
            [self.bgView addGestureRecognizer:pan];
        });
    }];
    
    self.tabelView.rowHeight = 150;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self.tabelView registerNib:[UINib nibWithNibName:@"TabelViewCell" bundle:nil] forCellReuseIdentifier:@"Identifier"];
    
    for (int i = 0; i < 20; i++) {
        model *m = [[model alloc] init];
        m.isSelect = NO;
        [self.array addObject:m];
    }
    
}
#pragma mark - 监听手势
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)pan
{
    
    [self.view addSubview:self.tabelView];
    [self.view addSubview:self.bottomView];
    typeof(self) weakSelf = self;
    [self.bottomView bottomViewWithClickNextStep:^{
        [weakSelf.tabelView removeFromSuperview];
        [weakSelf.bgView removeFromSuperview];
        [weakSelf.bottomView removeFromSuperview];
        [weakSelf.view addSubview:weakSelf.genderView];
        
        weakSelf.genderView.alpha = 0;
        weakSelf.genderView.transform = CGAffineTransformMakeTranslation(0, screenH );
        [UIView animateWithDuration:1 animations:^{
            weakSelf.genderView.transform = CGAffineTransformIdentity;
             weakSelf.genderView.alpha = 1;
        }];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TabelViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    cell.idp = indexPath;
    cell.model = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    model *m = self.array[indexPath.row];
   
    if (m.isSelect) {
        m.isSelect = NO;
        self.count--;
        self.bottomView.selectCount = self.count;
    }else{
        m.isSelect = YES;
        self.count++;
        
        self.bottomView.selectCount = self.count;
    }
    
    [self.tabelView reloadData];
}


- (UITableView *)tabelView
{
    if (!_tabelView ) {
        
        CGRect frame = CGRectMake(0,0,self.view.bounds.size.width , self.view.bounds.size.height - bottomH);
        _tabelView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tabelView;
}

- (UIImageView *)bgView
{
    if (!_bgView ) {
        CGRect rect = CGRectMake(0, 0, screenW, screenH);
        _bgView = [[UIImageView alloc] initWithFrame:rect];
    }
    return _bgView;
}

- (NSMutableArray *)array
{
    if (!_array ) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (YKBottomView *)bottomView
{
    if (!_bottomView ) {
        _bottomView = [YKBottomView bottomView];
        _bottomView.frame = CGRectMake(0, screenH - bottomH, screenW, bottomH);
    }
    return _bottomView;
}

- (GenderView *)genderView
{
    if (!_genderView ) {
        _genderView = [GenderView GenderView];
        _bottomView.frame = CGRectMake(0, 0 , screenW, screenH);
    }
    return _genderView;
}

@end
