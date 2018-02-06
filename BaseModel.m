//
//  BaseModel.m
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/12/1.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
- (NSString *)getCellID {
    return NSStringFromClass(self.class);
}

- (CGFloat)getCellHeight{
    return 0;
}

+ (instancetype)initWithDic:(NSDictionary *)dict{
    return [self new];
}
@end
