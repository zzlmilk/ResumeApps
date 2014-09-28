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
 个性展示  Personality
 
 
 */

#import <Foundation/Foundation.h>
#import "Personal.h"
#import "Objective.h"
#import "Education.h"
#import "Personality.h"

typedef enum{
    PersonalAttribute = 0,
    ObjectiveAttribute =1,
    EducationAttribute =2,
    PersonalityAttribute =3,
    
}resumeAttribute;




@interface Resume : NSObject

@property(nonatomic,strong) Personal *personal;
@property(nonatomic,strong) Objective *objective;
@property(nonatomic,strong) Education *education;
@property(nonatomic,strong) Personality *personality;


@end
