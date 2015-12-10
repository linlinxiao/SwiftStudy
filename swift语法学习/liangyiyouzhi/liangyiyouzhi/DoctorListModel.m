//
//  DoctorListModel.m
//  liangyizhi
//
//  Created by PT4 on 15/9/17.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "DoctorListModel.h"
#import "ServiceListModel.h"

@implementation DoctorListModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    
    if (self)
    {
        _valid = [jsonDic[@"valid"] boolValue];
        __id = jsonDic[@"id"];
        _level = [jsonDic[@"level"] intValue];
        
//        _adviserListModel = [jsonDic[@"adviser"] isKindOfClass:[NSNull class]] || !jsonDic[@"adviser"] ? nil : [[AdviserListModel alloc]initContentWithDic:jsonDic[@"adviser"]];
        _hospitalModel = [jsonDic[@"hospital"] isKindOfClass:[NSNull class]] || !jsonDic[@"hospital"] ? nil : [[HospitalModel alloc]initContentWithDic:jsonDic[@"hospital"]];
//        _userModel = [jsonDic[@"user"] isKindOfClass:[NSNull class]] || !jsonDic[@"user"] ? nil : [[UserModel alloc]initContentWithDic:jsonDic[@"user"]];
        _products = [self productsWithArray:jsonDic[@"products"]];
    }
    return self;
}

- (NSArray *)productsWithArray:(NSArray *)array
{
    NSMutableArray *temp = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [temp addObject:[[ServiceListModel alloc] initContentWithDic:obj]];
    }];
    
    return temp;
}

@end