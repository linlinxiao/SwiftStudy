//
//  ServiceListModel.m
//  2
//
//  Created by PT4 on 15/9/11.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "ServiceListModel.h"

@implementation ServiceListModel

//热门推荐使用这个
- (id)initContentWithProductDic:(NSDictionary *)productDic
{
    if (self == [super initContentWithDic:productDic])
    {
        _productId = productDic[@"product_id"];
        self.display = [productDic[@"display"] boolValue];
        self.product = [self isNullObject:productDic[@"product"]] ? nil : [NSDictionary dictionaryWithDictionary:productDic[@"product"]];
        _priceModel = [[PriceModel alloc] initContentWithDic:self.product[@"price"]];
        self.productName = self.product[@"name"];
        self.productThumb = self.product[@"thumb"];
        self.productCover = self.product[@"cover"];
        self.productIntroduction = self.product[@"introduction"];
        
        //非空判断
        _doctorModel = [self.product[@"doctor"] isKindOfClass:[NSNull class]] || !self.product[@"doctor"] ? nil : [[DoctorListModel alloc]initContentWithDic:self.product[@"doctor"]];
//        _adviserListModel = [self.product[@"adviser"] isKindOfClass:[NSNull class]] || !self.product[@"adviser"] ? nil : [[AdviserListModel alloc]initContentWithDic:self.product[@"adviser"]];
        _hospitalModel = [self.product[@"hospital"] isKindOfClass:[NSNull class]] || !self.product[@"hospital"] ? nil : [[HospitalModel alloc]initContentWithDic:self.product[@"hospital"]];
    }
    return self;
}

//服务列表使用这个
- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    if (self == [super initContentWithDic:jsonDic])
    {
        _productId = jsonDic[@"id"];
        self.productName = jsonDic[@"name"];
        _priceModel = [[PriceModel alloc] initContentWithDic:jsonDic[@"price"]];
        self.productThumb = jsonDic[@"thumb"];
        self.productCover = jsonDic[@"cover"];
        self.productIntroduction = jsonDic[@"introduction"];
        
        //非空判断
        _doctorModel = [jsonDic[@"doctor"] isKindOfClass:[NSNull class]] || !jsonDic[@"doctor"] ? nil : [[DoctorListModel alloc]initContentWithDic:jsonDic[@"doctor"]];
//        _adviserListModel = [jsonDic[@"adviser"] isKindOfClass:[NSNull class]] || !jsonDic[@"adviser"] ? nil : [[AdviserListModel alloc]initContentWithDic:jsonDic[@"adviser"]];
        _hospitalModel = [jsonDic[@"hospital"] isKindOfClass:[NSNull class]] || !jsonDic[@"hospital"] ? nil : [[HospitalModel alloc]initContentWithDic:jsonDic[@"hospital"]];
    }
    return self;
}

@end
