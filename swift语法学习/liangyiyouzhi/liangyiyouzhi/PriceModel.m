//
//  PriceModel.m
//  liangyizhi
//
//  Created by linlin on 15/11/5.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "PriceModel.h"

@implementation PriceModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    
    if (self) {
        _priceId = jsonDic[@"id"];
    }
    
    return self;
}

- (ProductPayType)productPayType
{
    if ([self.payType isEqualToString:@"pre"]) {
        return ProductPayTypePre;
    }
    else if ([self.payType isEqualToString:@"full"])
    {
        return ProductPayTypeFull;
    }
    
    return ProductPayTypeNone;
}

@end
