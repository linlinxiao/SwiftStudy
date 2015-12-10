//
//  ServiceListModel.h
//  2
//
//  Created by PT4 on 15/9/11.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "BaseModel.h"
#import "DoctorListModel.h"
//#import "AdviserListModel.h"
#import "HospitalModel.h"
#import "PriceModel.h"

@interface ServiceListModel : BaseModel

@property (nonatomic, assign, getter=isDisplay) BOOL display;
@property (nonatomic, assign) int sortNum;
@property (nonatomic, strong) PriceModel *priceModel;
@property (nonatomic, strong) NSDictionary *product;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *productCategory;
@property (nonatomic, strong) NSString *productThumb;
@property (nonatomic, strong) NSString *productCover;
@property (nonatomic, strong) NSString *productIntroduction;
@property (nonatomic, strong) NSString *productNotice;

@property (nonatomic, strong) DoctorListModel *doctorModel;
//@property (nonatomic, strong) AdviserListModel *adviserListModel;
@property (nonatomic, strong) HospitalModel *hospitalModel;

/**
 *热门推荐使用这个
 */
- (id)initContentWithProductDic:(NSDictionary *)productDic;

/**
 *服务列表使用这个
 */
- (id)initContentWithDic:(NSDictionary *)jsonDic;

@end
