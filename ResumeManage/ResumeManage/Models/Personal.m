//
//  Personal.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Personal.h"

@implementation Personal
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"个人信息";
        self.description = @"个人信息的描述";
        self.number = @"1";
        self.color = [UIColor colorWithRed:237/255.f green:180/255.0 blue:44/255.f alpha:1.f];
        self.isComplete = NO;

    }
    return self;
}
@end
