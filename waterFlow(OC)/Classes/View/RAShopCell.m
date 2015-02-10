//
//  RAShopCell.m
//  waterFlow(OC)
//
//  Created by Rocky Ao on 15/1/18.
//  Copyright (c) 2015年 RockyAo. All rights reserved.
//

#import "RAShopCell.h"
#import "RAShop.h"
#import "UIImageView+WebCache.h"
@interface RAShopCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
@implementation RAShopCell
- (void)setShop:(RAShop *)shop
{
 
    _shop = shop;
    
    self.priceLabel.text = shop.price;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
}
@end
