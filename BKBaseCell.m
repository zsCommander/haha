//
//  BKBaseCell.m
//  xiaocong
//
//  Created by zuoshuai on 2017/12/15.
//  Copyright © 2017年 ZS. All rights reserved.
//

#import "BKBaseCell.h"

@implementation BKBaseCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    return nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
