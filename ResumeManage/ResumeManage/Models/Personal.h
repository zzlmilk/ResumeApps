//
//  Personal.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Base.h"

typedef enum{
    male, //男
    fale
} genderType;


@interface Personal : Base

@property(nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *birthday;
@property(nonatomic)genderType gender;

@property(nonatomic,strong)NSString *email;
@property(nonatomic,strong)NSString *cellPhone;

@property(nonatomic,strong)NSString * workExperience;
@property(nonatomic,strong)NSString *identificationType;//证件类型
@property(nonatomic,strong)NSString *identification; //证件号




@end
