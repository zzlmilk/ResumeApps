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
        _personal.title = @"个人信息";
        _personal.description = @"";
        _personal.number = @"1";
        _personal.color = [UIColor colorWithRed:237/255.f green:180/255.0 blue:44/255.f alpha:1.f];
        _personal.isComplete = NO;
        
    }
    return self;
}
@end
