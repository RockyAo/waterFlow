//
//  ViewController.m
//  waterFlow(OC)
//
//  Created by Rocky Ao on 15/1/18.
//  Copyright (c) 2015年 RockyAo. All rights reserved.
//

#import "ViewController.h"
#import "RAWaterFlowLayout.h"
#import "RAShopCell.h"
#import "RAShop.h"
#import "MJExtension.h"

#define KMainSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,RAWaterFlowLayoutDelegate>
@property (nonatomic,weak)UICollectionView *collectionView;

@property (strong,nonatomic)NSArray *shops;
@end

@implementation ViewController

static NSString *const cellId = @"shop";


- (NSArray *)shops
{
    if (!_shops) {
        self.shops = [RAShop objectArrayWithFilename:@"1.plist"];
    }
    return _shops;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    RAWaterFlowLayout *layout = [[RAWaterFlowLayout alloc] init];
    
    layout.delegate = self;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    

    [collectionView registerNib:[UINib nibWithNibName:@"RAShopCell" bundle:nil] forCellWithReuseIdentifier:cellId];
    
    if (KMainSystemVersion < 8.0) {
        
        collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    }
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    

}

#pragma mark <UICollectionViewDataSource>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    RAShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.shop = self.shops[indexPath.item];
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return  self.shops.count;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    
}

#pragma mark <RAWaterFlowLayoutDelegate>
-(CGFloat)waterFlowLayout:(RAWaterFlowLayout *)waterFlowLayout heigthForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    
    RAShop *shop = self.shops[indexPath.item];
    
    return shop.h * itemWidth / shop.w;
}

//- (int)maxColumnsInWaterFlowLaout:(RAWaterFlowLayout *)waterFlowLayout
//{
//
//    return  3;
//}
@end
