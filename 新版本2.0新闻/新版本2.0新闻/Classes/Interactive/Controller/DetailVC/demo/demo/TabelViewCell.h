//
//  TabelViewCell.h
//  demo
//
//  Created by Eric.Wu on 17/2/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "model.h"
@interface TabelViewCell : UITableViewCell

@property (nonatomic,strong) NSIndexPath *idp;

@property (nonatomic,strong) model *model;
@end
