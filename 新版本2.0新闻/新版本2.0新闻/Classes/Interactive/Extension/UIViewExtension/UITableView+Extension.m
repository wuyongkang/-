//
//  UITableView+Extension.m
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)



+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
{
    UITableView *tv = [[self alloc] initWithFrame:CGRectZero style:style];
    tv.delegate = delegate;
    tv.dataSource = dataSource;
    tv.separatorStyle = separatorStyle;
    return tv;
}


+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle rowHeight:(CGFloat)rowHeight
{
    
    UITableView *tv = [self tableViewWithDelegate:delegate dataSource:dataSource style:style separatorStyle:separatorStyle];
    tv.rowHeight = rowHeight;
    return tv;
}


+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle backgroundColor:(UIColor *)backgroundColor
{
    UITableView *tv = [self tableViewWithDelegate:delegate dataSource:dataSource style:style separatorStyle:separatorStyle];
    tv.backgroundColor = backgroundColor;
    return tv;
}



+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle backgroundColor:(UIColor *)backgroundColor rowHeight:(CGFloat)rowHeight
{
    UITableView *tv = [self tableViewWithDelegate:delegate dataSource:dataSource style:style separatorStyle:separatorStyle rowHeight:rowHeight];
    tv.backgroundColor = backgroundColor;
    return tv;
}

@end
