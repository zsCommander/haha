//
//  BaseCell.m
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/12/7.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    return [BaseCell new];
}

- (void)config:(BaseModel *)model{
    
}

+ (NSString *)getClassName{
    return NSStringFromClass(self);
}
@end
