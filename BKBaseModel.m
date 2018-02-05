//
//  BKBaseModel.m
//  xiaocong
//
//  Created by zuoshuai on 2017/12/14.
//  Copyright © 2017年 ZS. All rights reserved.
//

#import "BKBaseModel.h"

@implementation BKBaseModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *)getCellID {
    return @"BKBaseCell";
}

- (CGFloat)getCellHeight{
    return 0;
}

+ (instancetype)initWithDic:(NSDictionary *)dict{
    return [self new];
}

- (id)copyWithZone:(NSZone *)zone{
    BKBaseModel *m = [[self class] allocWithZone:zone];
    m.height = self.height;
    m.size = self.size;
    return m;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    BKBaseModel *m = [[self class] allocWithZone:zone];
    return m;
}
@end
