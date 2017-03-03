//
//  UITableView+Extension.h
//  category
//
//  Created by xiliedu on 15/12/21.
//  Copyright © 2015年 xiliedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)
/**
 *  @param delegate       代理
 *  @param dataSource     数据源
 *  @param style          样式
 *  @param separatorStyle 分割线样式
 */
+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;

/**
 *  @param delegate       代理
 *  @param dataSource     数据源
 *  @param style          样式
 *  @param separatorStyle 分割线样式
 *  @param rowHeight 固定行高
 */
+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle rowHeight:(CGFloat)rowHeight;

/**
 *  @param delegate       代理
 *  @param dataSource     数据源
 *  @param style          样式
 *  @param separatorStyle 分割线样式
 *  @param backgroundColor 背景颜色
 */
+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle backgroundColor:(UIColor *)backgroundColor;

/**
 *  @param delegate       代理
 *  @param dataSource     数据源
 *  @param style          样式
 *  @param separatorStyle 分割线样式
 *  @param backgroundColor 背景颜色
 *  @param rowHeight 固定行高
 */
+ (instancetype)tableViewWithDelegate:(id<UITableViewDelegate>)delegate dataSource:(id<UITableViewDataSource>)dataSource style:(UITableViewStyle)style separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle backgroundColor:(UIColor *)backgroundColor rowHeight:(CGFloat)rowHeight;
@end
