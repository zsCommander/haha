//
//  ZSTableViewDataSource.m
//  EducationPlatfrom
//
//  Created by zuoshuai on 2017/11/30.
//  Copyright © 2017年 zuoshuai. All rights reserved.
//

#import "ZSTableViewDataSource.h"
#import "BKBaseModel.h"
#import "BKBaseCell.h"

@interface ZSTableViewDataSource()

@property (nonatomic,readwrite,copy) NSString *cellIdentifier;
@property (nonatomic,readwrite,copy) ZSTableViewCellConfigureBlock configureCellBlock;
@property (nonatomic,readwrite,copy) ZSTabelViewDidSelectBlock didSelectBlock;
@property (nonatomic,readwrite,assign) NSInteger sectionCount;

@property (nonatomic,readwrite,strong) UIView *sectionHeader;
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
        self.sectionHeader = nil;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return self.items[(NSUInteger)indexPath.row];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    BKBaseModel *baseModel = (BKBaseModel *)item;

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[baseModel getCellID]?[baseModel getCellID]:@"BKBaseCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:[baseModel getCellID] owner:nil options:nil].firstObject;
    }
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, item,indexPath);
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionCount;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BKBaseCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    BKBaseModel *model = [self itemAtIndexPath:indexPath];
    if (self.didSelectBlock) {
        self.didSelectBlock(cell, model,indexPath);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BKBaseModel *model = [self itemAtIndexPath:indexPath];
    return model.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.sectionHeader) {
       return self.sectionHeader.height;
    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.sectionHeader;
}



- (void)dealloc{
    self.didSelectBlock = nil;
}

- (void)setHeaderInSection:(UIView *)headerView{
    self.sectionHeader = headerView;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if ([self.ZS_ScrollDelegate respondsToSelector:@selector(ZS_scrollViewDidEndDragging:)]) {
        [self.ZS_ScrollDelegate ZS_scrollViewDidEndDragging:scrollView.contentOffset];
    }
}


@end

