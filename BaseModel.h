//
//  BaseModel.h
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/12/1.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
/**
 *  model父类里的控制cell的id
 */
@property(nonatomic,readwrite,copy) NSString *cellIdentifier;
- (NSString *)getCellID;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
- (CGFloat)getCellHeight;
+ (instancetype)initWithDic:(NSDictionary *)dict;
@end
