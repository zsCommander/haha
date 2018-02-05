//
//  BaseCell.h
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/12/7.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

@interface BaseCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)config:(BaseModel *)model;
+ (NSString *)getClassName;
@end
