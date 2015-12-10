//
//  HospitalModel.m
//  liangyizhi
//
//  Created by PT4 on 15/9/17.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "HospitalModel.h"

@implementation HospitalModel

- (id)initContentWithDic:(NSDictionary *)jsonDic
{
    self = [super initContentWithDic:jsonDic];
    if (self)
    {
        __id = jsonDic[@"id"];
    }
    return self;
}

@end
