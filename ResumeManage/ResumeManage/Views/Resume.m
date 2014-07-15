//
//  Resume.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Resume.h"



@implementation Resume
-(instancetype)init{
    if (self = [super init]) {        
        _personal = [[Personal alloc]init];
        _objective = [[Objective alloc]init];
        _education = [[Education alloc]init];

        
    }
    return self;
}
@end
