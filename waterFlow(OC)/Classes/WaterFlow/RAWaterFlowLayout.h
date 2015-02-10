//
//  RAWaterFlowLayout.h
//  waterFlow(OC)
//
//  Created by Rocky Ao on 15/1/18.
//  Copyright (c) 2015年 RockyAo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RAWaterFlowLayout;

@protocol RAWaterFlowLayoutDelegate <NSObject>

/**
 *  计算每一个item高度
 *
 *  @param waterFlowLayout 布局
 *  @param indexPath       位置
 *  @param itemWidth       每一行的宽度
 *
 *  @return 每一行的高度
 */
- (CGFloat)waterFlowLayout:(RAWaterFlowLayout *)waterFlowLayout heigthForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 *  返回四周的间距，默认是UIEdgeInsetsMake(10, 10, 10, 10)
 */
- (UIEdgeInsets)insetsInWaterFlowLaout:(RAWaterFlowLayout *)waterFlowLayout;
/**
 *  返回最大的列数, 默认是3
 */
- (int)maxColumnsInWaterFlowLaout:(RAWaterFlowLayout *)waterFlowLayout;
/**
 *  返回每行的间距, 默认是10
 */
- (CGFloat)rowMarginInWaterFlowLaout:(RAWaterFlowLayout *)waterFlowLayout;
/**
 *  返回每列的间距, 默认是10
 */
- (CGFloat)columnMarginInWaterFlowLaout:(RAWaterFlowLayout *)waterFlowLayout;


@end

@interface RAWaterFlowLayout : UICollectionViewFlowLayout

@property (nonatomic,weak)id<RAWaterFlowLayoutDelegate> delegate;

@end
