//
//  GenderAboutndustryView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "GenderAboutndustryView.h"

@implementation GenderAboutndustryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _aboutOccupationArray = [[NSArray alloc]initWithObjects:@"汽车制造业",
                                 @"移动互联网",@"现代物流",nil];
        
        //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing2"]];
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        UILabel *descriptionTwoLabel = [[UILabel alloc]init];
        descriptionTwoLabel.frame = CGRectMake(25, 88, rectFrame.size.width-70, 72);
        descriptionTwoLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tishiyu"]];
        [self addSubview:descriptionTwoLabel];
        
        UILabel *genderBorderLabel = [[UILabel alloc]init];
        genderBorderLabel.frame = CGRectMake(37, 227, rectFrame.size.width-37, 38);
        genderBorderLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dian2"]];
        [self addSubview:genderBorderLabel];
        
        UILabel *oneNumberLabel = [[UILabel alloc]init];
        oneNumberLabel.frame = CGRectMake(45, 220, rectFrame.size.width-37, 38);
        oneNumberLabel.text = @"1";
        oneNumberLabel.textColor = [UIColor whiteColor];
        [self addSubview:oneNumberLabel];
        
        UILabel *mayGenderLabel = [[UILabel alloc]init];
        mayGenderLabel.frame = CGRectMake(78, 220, rectFrame.size.width-40, 38);
        mayGenderLabel.text = @"你的性别可能是：";
        mayGenderLabel.textColor = RGBACOLOR(255, 255, 255, 0.7f);
        mayGenderLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [self addSubview:mayGenderLabel];
        
        UIButton *genderButton = [[UIButton alloc]init];
        genderButton.frame =CGRectMake(36, 220, rectFrame.size.width-40, 38);
        _genderTitle = @"女";
        genderButton.backgroundColor = [UIColor clearColor];
        genderButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        [genderButton setTitle:_genderTitle forState:UIControlStateNormal];
        [genderButton setTitleEdgeInsets:UIEdgeInsetsMake(0,110,0,0)];
        [genderButton addTarget:self action:@selector(editGender:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:genderButton];
        
        UILabel *aboutOccupationLabel = [[UILabel alloc]init];
        aboutOccupationLabel.frame = CGRectMake(40, 314, rectFrame.size.width-107, 16);
        aboutOccupationLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"xiangguanhangye"]];
        [self addSubview:aboutOccupationLabel];
        
        
        UILabel *aboutOccupationLabelOne = [[UILabel alloc]init];
        aboutOccupationLabelOne.frame =CGRectMake(40, 364, rectFrame.size.width-107, 16);
        aboutOccupationLabelOne.text = @"1.汽车制造业";
        aboutOccupationLabelOne.textColor = RGBACOLOR(255,255,255,0.7f);
        [self addSubview:aboutOccupationLabelOne];
        
        UILabel *aboutOccupationLabelTwo = [[UILabel alloc]init];
        aboutOccupationLabelTwo.frame =CGRectMake(40, 400, rectFrame.size.width-107, 16);
        aboutOccupationLabelTwo.text = @"2.移动互联网";
        aboutOccupationLabelTwo.textColor = RGBACOLOR(255,255,255,0.7f);
        [self addSubview:aboutOccupationLabelTwo];
        
        UILabel *aboutOccupationLabelThree = [[UILabel alloc]init];
        aboutOccupationLabelThree.frame =CGRectMake(40, 436, rectFrame.size.width-107, 16);
        aboutOccupationLabelThree.text = @"3.现代物流";
        aboutOccupationLabelThree.textColor = RGBACOLOR(255,255,255,0.7f);
        [self addSubview:aboutOccupationLabelThree];
        
        
    }
    return self;
}

//修改系统预测性别
-(void)editGender:(UIButton *)sender{
    
    UIButton *genderButton = (UIButton *)sender;
    
    if ([genderButton.titleLabel.text isEqual:@"女"]) {
        
        [genderButton setTitle:@"男" forState:UIControlStateNormal];
        
    }else{
    
        [genderButton setTitle:@"女" forState:UIControlStateNormal];
    
    }


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
