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
        self.color = RGBACOLOR(44, 123, 179, 0.8f);
        self.isComplete = NO;
    }
    return self;
}
@end
