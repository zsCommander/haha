//
//  ZSTableViewDataSource.m
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/11/30.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import "ZSTableViewDataSource.h"

@interface ZSTableViewDataSource()

@property (nonatomic,readwrite,copy) NSString *cellIdentifier;
@property (nonatomic,readwrite,copy) ZSTableViewCellConfigureBlock configureCellBlock;
@property (nonatomic,readwrite,copy) ZSTabelViewDidSelectBlock didSelectBlock;
@property (nonatomic,readwrite,assign) NSInteger sectionCount;
@end

@implementation ZSTableViewDataSource

- (instancetype)init
{
    return nil;
}

- (id)initWithItems:(NSArray *)anItems
       sectionCount:(NSInteger)sectionCount
 configureCellBlock:(ZSTableViewCellConfigureBlock)aConfigureCellBlock
     didSelectBlock:(ZSTabelViewDidSelectBlock)aDidSelectBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.configureCellBlock = aConfigureCellBlock;
        self.didSelectBlock = aDidSelectBlock;
        self.sectionCount = sectionCount;
    }
    return self;
}

- (id)initWithItems:(NSArray *)anItems sectionCount:(NSInteger)sectionCount configureCellBlock:(ZSTableViewCellConfigureBlock)aConfigureCellBlock didSelectBlock:(ZSTabelViewDidSelectBlock)aDidSelectBlock sectionHeaders:(NSArray *)sectionHeaderViews{
    self = [self initWithItems:anItems sectionCount:sectionCount configureCellBlock:aConfigureCellBlock didSelectBlock:aDidSelectBlock];
    if (self) {
        self.sectionHeaderViews = [sectionHeaderViews mutableCopy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sectionCount > 1) {
        id a = self.items[indexPath.section];
        if ([a isKindOfClass:[NSArray class]]) {
            NSArray *array = a;
            if (array.count > 0) {
                return [array safeObjectAtIndex:indexPath.row];
            }
        }else{
            return [self.items safeObjectAtIndex:indexPath.row];
        }
    }
    return [self.items safeObjectAtIndex:indexPath.section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];

    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:[item getCellID]];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:[item getCellID] owner:nil options:nil].firstObject;
    }
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, item);
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.sectionCount > 1) {
        id a = [self.items safeObjectAtIndex:section];
        if ([a isKindOfClass:[NSArray class]]) {
            NSArray *array = a;
            if (array.count > 0) {
                return array.count;
            }
        }else{
            return self.items.count;
        }
    }
    return self.items.count;;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionCount;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    BaseModel *model = [self itemAtIndexPath:indexPath];
    if (self.didSelectBlock) {
        self.didSelectBlock(cell, model);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseModel *model = [self itemAtIndexPath:indexPath];
    return model.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.sectionHeaderViews.count > 0) {
        if (section+1 > _sectionHeaderViews.count) {
            return [UIView new];
        }
       return self.sectionHeaderViews[section];
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.sectionHeaderViews.count > 0) {
        if (section+1 > _sectionHeaderViews.count) {
            return 0.01;
        }
        UIView *view = self.sectionHeaderViews[section];
        return view.height;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)dealloc{
    self.didSelectBlock = nil;
}
@end

