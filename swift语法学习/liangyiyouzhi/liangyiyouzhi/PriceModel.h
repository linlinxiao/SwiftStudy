//
//  PriceModel.h
//  liangyizhi
//
//  Created by linlin on 15/11/5.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "BaseModel.h"

typedef NS_ENUM(NSUInteger, ProductPayType) {
    ProductPayTypePre,
    ProductPayTypeFull,
    ProductPayTypeNone = -1
};

@interface PriceModel : BaseModel

@property (nonatomic, copy) NSString *priceId;
@property (nonatomic, copy) NSString *payType;
@property (nonatomic, strong) NSNumber *price;//原价
@property (nonatomic, strong) NSNumber *promotionPrice;//促销价
@property (nonatomic, strong) NSNumber *couponPromotionPrice;//优惠价
@property (nonatomic, strong) NSNumber *deposit;//预定金
@property (nonatomic, strong) NSNumber *couponDepositPrice;//优惠预定金
@property (nonatomic, assign) ProductPayType productPayType;

@end
