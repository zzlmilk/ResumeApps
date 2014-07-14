//
//  Objective.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Objective.h"

@implementation Objective
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"求职意向";
        self.description = @"求职意向";
        self.number = @"2";
        self.color = [UIColor colorWithRed:80/255.f green:51/255.0 blue:175/255.f alpha:1.f];
        self.isComplete = NO;
    }
    return self;
}
@end
