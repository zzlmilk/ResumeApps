//
//  IWish.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "IWishView.h"

@implementation IWishView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        payLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 40)];
        payLabel.text = @"期望薪资：";
        payLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:payLabel];
        
        payTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 20, 200, 40)];
        payTextLabel.backgroundColor = [UIColor clearColor];
        payTextLabel.text = @"3000";
        [self addSubview:payTextLabel];
        
        positionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 100, 40)];
        positionLabel.text = @"职位名称：";
        positionLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:positionLabel];
        
        positionTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 80, 200, 40)];
        positionTextLabel.backgroundColor = [UIColor clearColor];
        positionTextLabel.text = @"UI设计师";
        [self addSubview:positionTextLabel];
        
        relatedPaidIndustryLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, 100, 40)];
        relatedPaidIndustryLabel.text = @"相关职业：";
        relatedPaidIndustryLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:relatedPaidIndustryLabel];
        
        relatedPaidIndustryTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 140, 200, 70)];
        relatedPaidIndustryTextLabel.numberOfLines =0;
        relatedPaidIndustryTextLabel.backgroundColor = [UIColor clearColor];
        relatedPaidIndustryTextLabel.text = @"汽车制造页，移动互联网，UI设计师 , 现代物流，电子商务";
        [self addSubview:relatedPaidIndustryTextLabel];

        
        
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
