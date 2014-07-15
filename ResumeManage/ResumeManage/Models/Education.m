//
//  Education.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Education.h"

@implementation Education
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"教育经历";
        self.description = @"教育经历";
        self.number = @"3";
        self.color = [UIColor colorWithRed:27/255.f green:175/255.f blue:32/255.f alpha:1.f];
        self.isComplete = NO;
        
    }
    return self;

}

@end
