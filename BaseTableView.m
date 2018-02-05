//
//  BaseTableView.m
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/12/7.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setTableBackColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setTableBackColor];
    }
    return self;
}


- (void)setTableBackColor {
//    self.backgroundColor = ZS_k10hxColorWithRGB(254, 254, 254, 1);
}
@end
