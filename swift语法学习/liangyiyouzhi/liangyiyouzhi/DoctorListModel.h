//
//  DoctorListModel.h
//  liangyizhi
//
//  Created by PT4 on 15/9/17.
//  Copyright (c) 2015年 yixinzhijia. All rights reserved.
//

#import "BaseModel.h"
//#import "AdviserListModel.h"
#import "HospitalModel.h"
//#import "UserModel.h"

@interface DoctorListModel : BaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int level;
@property (nonatomic, strong) NSString *specialty;//擅长
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *avatarUrl;//头像
@property (nonatomic, copy) NSString *department;//科室
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, assign, getter=isValid) BOOL valid;
@property (nonatomic, strong) NSString *_id;

//@property (nonatomic, strong) AdviserListModel *adviserListModel;
@property (nonatomic, strong) HospitalModel *hospitalModel;
//@property (nonatomic, strong) UserModel *userModel;
@property (nonatomic, copy) NSArray *products;//服务产品

@end
