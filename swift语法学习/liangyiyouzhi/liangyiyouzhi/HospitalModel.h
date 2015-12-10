//
//  HospitalModel.h
//  liangyizhi
//
//  Created by PT4 on 15/9/17.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "BaseModel.h"

@interface HospitalModel : BaseModel

@property (nonatomic, strong) NSString *_id;
@property (nonatomic, strong) NSString *name;//医院名
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, strong) NSString *aliases;

@end
