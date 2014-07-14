//
//  Resume.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

/*
 简历的model 
 个人信息  Personal
 教育经历  Education
 工作经验  Experience
 求职意向  Objective
 培训经历  Training
 附加信息  Additional
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Personal.h"


@interface Resume : NSObject

@property(nonatomic,strong)Personal *personal;


@end
