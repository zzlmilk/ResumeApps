//
//  GenderAboutndustryView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "GenderAboutndustryView.h"
#import "Industry.h"

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
        
 
        UILabel *mayGenderLabel = [[UILabel alloc]init];
        mayGenderLabel.frame = CGRectMake(90, 310, rectFrame.size.width-40, 38);
        mayGenderLabel.text = @"你的性别可能是：";
        mayGenderLabel.textColor = RGBACOLOR(78, 145, 192, 1.0f);
        mayGenderLabel.font = [UIFont boldSystemFontOfSize:18.0];
        [self addSubview:mayGenderLabel];
        
        UIButton *genderButton = [[UIButton alloc]init];
        genderButton.frame =CGRectMake(45, 310, rectFrame.size.width-40, 38);
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        _genderTitle = [userDefaults stringForKey:@"genderString"];
        genderButton.backgroundColor = [UIColor clearColor];
        [genderButton setTitleColor:RGBACOLOR(96,96,96,1.0f) forState:UIControlStateNormal];
        genderButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        [genderButton setTitle:_genderTitle forState:UIControlStateNormal];
        [genderButton setTitleEdgeInsets:UIEdgeInsetsMake(0,110,0,0)];
        [genderButton addTarget:self action:@selector(editGender:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:genderButton];
        
//        UILabel *aboutOccupationLabel = [[UILabel alloc]init];
//        aboutOccupationLabel.frame = CGRectMake(40, 314, rectFrame.size.width-107, 16);
//        aboutOccupationLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"xiangguanhangye"]];
//        [self addSubview:aboutOccupationLabel];
//        
//        
//        UILabel *aboutOccupationLabelOne = [[UILabel alloc]init];
//        aboutOccupationLabelOne.frame =CGRectMake(40, 364, rectFrame.size.width-107, 16);
//        aboutOccupationLabelOne.text = [userDefaults stringForKey:@"heightIndustryString"];
//        aboutOccupationLabelOne.text = @"1.汽车制造业";
//        aboutOccupationLabelOne.textColor = RGBACOLOR(255,255,255,0.7f);
//        //aboutOccupationLabelOne.backgroundColor = [UIColor redColor];
//        [self addSubview:aboutOccupationLabelOne];
//        
//        UILabel *aboutOccupationLabelTwo = [[UILabel alloc]init];
//        aboutOccupationLabelTwo.frame =CGRectMake(40, 400, rectFrame.size.width-107, 16);
//        aboutOccupationLabelTwo.text = @"2.移动互联网";
//        aboutOccupationLabelTwo.textColor = RGBACOLOR(255,255,255,0.7f);
//        [self addSubview:aboutOccupationLabelTwo];
//        
//        UILabel *aboutOccupationLabelThree = [[UILabel alloc]init];
//        aboutOccupationLabelThree.frame =CGRectMake(40, 436, rectFrame.size.width-107, 16);
//        aboutOccupationLabelThree.text = @"3.现代物流";
//        aboutOccupationLabelThree.textColor = RGBACOLOR(255,255,255,0.7f);
//        [self addSubview:aboutOccupationLabelThree];
        
        
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
