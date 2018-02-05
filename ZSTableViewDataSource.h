//
//  ZSTableViewDataSource.h
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/11/30.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  对cell进行配置的回调
 @param cell cell
 @param item 数据源model
 */
typedef void(^ZSTableViewCellConfigureBlock)(id cell,id item);

typedef void(^ZSTabelViewDidSelectBlock)(id cell,id item);

@interface ZSTableViewDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>
/**
 *  数据源数组
 */
@property (nonatomic,readwrite,strong) NSArray *items;
/**
 @breif     cell初始化
 @return    cell
 */
- (id)initWithItems:(NSArray *)anItems
       sectionCount:(NSInteger)sectionCount
 configureCellBlock:(ZSTableViewCellConfigureBlock)aConfigureCellBlock
     didSelectBlock:(ZSTabelViewDidSelectBlock)aDidSelectBlock sectionHeaders:(NSArray *)sectionHeaderViews;

- (id)initWithItems:(NSArray *)anItems
       sectionCount:(NSInteger)sectionCount
 configureCellBlock:(ZSTableViewCellConfigureBlock)aConfigureCellBlock
     didSelectBlock:(ZSTabelViewDidSelectBlock)aDidSelectBlock;
/**
 *  根据indexPath获取数据
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  sectionHeaderViews
 */
@property (nonatomic,strong) NSMutableArray *sectionHeaderViews;
@end
