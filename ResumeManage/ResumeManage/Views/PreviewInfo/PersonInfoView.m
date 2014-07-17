//
//  PersonInfo.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "PersonInfoView.h"
#import "Colours.h"

@implementation PersonInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        headImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 80, 80)];
        headImage.backgroundColor = [UIColor lightCreamColor];
        [self addSubview:headImage];
        
        nameTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 20, 200, 40)];
        nameTextLabel.text = @"王先生";
        nameTextLabel.textColor = [UIColor black25PercentColor];
        nameTextLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:nameTextLabel];
        
        phoneTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 60, 200, 40)];
        phoneTextLabel.text = @"13234122386";
        phoneTextLabel.textColor = [UIColor black25PercentColor];
        phoneTextLabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:phoneTextLabel];
        
        educationTextlabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 110, 200, 40)];
        educationTextlabel.text = @"本科";
        educationTextlabel.textColor = [UIColor black25PercentColor];
        educationTextlabel.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:educationTextlabel];
        
        workExperienceTime = [[UILabel alloc]initWithFrame:CGRectMake(80, 110, 180, 40)];
        workExperienceTime.text = @"2年工作经验";
        workExperienceTime.textColor = [UIColor black25PercentColor];
        workExperienceTime.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:workExperienceTime];
        
        
        workExperienceStarEndTime = [[UILabel alloc]initWithFrame:CGRectMake(20, 160, 280, 40)];
        workExperienceStarEndTime.text = @"2010/7至2010/12";
        workExperienceStarEndTime.backgroundColor = [UIColor ghostWhiteColor];
        [self addSubview:workExperienceStarEndTime];
        
        workExperienceTitile = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, 280, 40)];
        workExperienceTitile.text = @"昆山富士康科技集团有限公司 制造部";
        workExperienceTitile.font = [UIFont boldSystemFontOfSize:17.f];
        workExperienceTitile.backgroundColor = [UIColor ghostWhiteColor];
        [self addSubview:workExperienceTitile];
        
        workExperienceContent = [[UILabel alloc]initWithFrame:CGRectMake(20, 220, 280, 240)];
        //[workExperienceContent sizeToFit];
        workExperienceContent.numberOfLines = 0;
        workExperienceContent.text = @"制定產線需求计划、5m确认，生产前的准备工作。.根据生产需求计划为依据，按订单交期、性质和大小、客户重要性、产品生产流程及规模等原则进行备料供产线生产。生产进度跟进、通过生产报表和仓库出入库交接掌握生产进度各效益，并枳极与生产部门进行串通确保生产计划顺利执行。生产异常的处理及汇报，协调各生产部门，寻求妥善的解决方案。";
        workExperienceContent.backgroundColor = [UIColor ghostWhiteColor];
        [self addSubview:workExperienceContent];
        
        
        

        
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
