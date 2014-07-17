//
//  Specialty.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "SpecialtyView.h"

@implementation SpecialtyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        majorLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 280, 40)];
        majorLabel.text = @"我的专业：";
        [self addSubview:majorLabel];
        
        majorTextlabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 20, 280, 40)];
        majorTextlabel.text = @"计算机";
        [self addSubview:majorTextlabel];
        
        
        hobbyLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 90, 280, 40)];
        hobbyLabel.text = @"兴趣爱好：";
        [self addSubview:hobbyLabel];
        
        hobbyTextlabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 90, 280, 40)];
        hobbyTextlabel.text = @"体育，看书，旅行";
        [self addSubview:hobbyTextlabel];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
