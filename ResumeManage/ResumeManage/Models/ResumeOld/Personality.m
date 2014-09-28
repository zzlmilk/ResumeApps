//
//  Personality.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Personality.h"

@implementation Personality

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"个性展示";
        self.description = @"个性展示";
        self.number = @"4";
        self.color = RGBACOLOR(44, 123, 179, 0.8f);
        self.isComplete = NO;
    }
    return self;
}
@end
