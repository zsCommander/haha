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
typedef void(^ZSTableViewCellConfigureBlock)(id cell,id item,NSIndexPath *indexPath);

typedef void(^ZSTabelViewDidSelectBlock)(id cell,id item,NSIndexPath *indexPath);


@protocol ZSScrollViewDelegate <NSObject>
- (void)ZS_scrollViewDidEndDragging:(CGPoint)offset;
@end

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
     didSelectBlock:(ZSTabelViewDidSelectBlock)aDidSelectBlock;
/**
 *  根据indexPath获取数据
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)setHeaderInSection:(UIView *)headerView;

@property (nonatomic, weak) id<ZSScrollViewDelegate> ZS_ScrollDelegate;
@end
