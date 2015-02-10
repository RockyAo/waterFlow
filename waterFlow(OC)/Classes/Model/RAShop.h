//
//  RAShop.h
//  waterFlow(OC)
//
//  Created by Rocky Ao on 15/1/18.
//  Copyright (c) 2015年 RockyAo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RAShop : NSObject

//图片宽度
@property (nonatomic,assign)CGFloat w;

//图片高度
@property (nonatomic,assign)CGFloat h;

//图片地址
@property (nonatomic,copy)NSString *img;

//价格
@property (nonatomic,copy)NSString *price;


@end
