//
//  BKBaseModel.h
//  xiaocong
//
//  Created by zuoshuai on 2017/12/14.
//  Copyright © 2017年 ZS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKBaseModel : NSObject <NSCopying,NSMutableCopying>
- (NSString *)getCellID;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
+ (instancetype)initWithDic:(NSDictionary *)dict;
@end
