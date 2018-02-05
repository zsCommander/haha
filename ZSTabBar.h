//
//  ZSTabBar.h
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/11/20.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSTabBar : UITabBar
/**
 *   点击tabbar中间加号
 */
@property (nonatomic,copy) void(^didMiddBtn)();
@end
