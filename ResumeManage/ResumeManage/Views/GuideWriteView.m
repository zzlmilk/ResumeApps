//
//  GuideWrite.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-28.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "GuideWriteView.h"
#import "IntroModel.h"
#import "IntroControll.h"
#import "Colours.h"
#import "MajorAndHobbyView.h"
#import "GenderAboutndustryView.h"
#import "EducationWorkExperienceView.h"
#import "SurnameAndPhoneView.h"
#import "TagAndPayView.h"

@implementation GuideWriteView

- (instancetype)initWithFrame:(CGRect)frame With:(id)_delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        MajorAndHobbyView *majorAndHobbyView = [[MajorAndHobbyView alloc]init];
        majorAndHobbyView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);

        IntroModel *model1 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"qiepian1" view:majorAndHobbyView];
        
        GenderAboutndustryView *genderAboutndustryView = [[GenderAboutndustryView alloc]init];
        genderAboutndustryView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        IntroModel *model2 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"qiePianEr" view:genderAboutndustryView];
        
        
        EducationWorkExperienceView *educationWorkExperienceView = [[EducationWorkExperienceView alloc]init];
        educationWorkExperienceView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        IntroModel *model3 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"yinDaoSan" view:educationWorkExperienceView];
        
        SurnameAndPhoneView *surnameAndPhoneView = [[SurnameAndPhoneView alloc]init];
        surnameAndPhoneView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        IntroModel *model4 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"beijingSi" view:surnameAndPhoneView];
        
        TagAndPayView *tagAndPayView = [[TagAndPayView alloc]init];
        tagAndPayView.delegate = _delegate;
        tagAndPayView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        IntroModel *model5 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"yinDaoWu" view:tagAndPayView];
        
        IntroControll *introControll = [[IntroControll alloc] initWithFrame:self.bounds pages:@[model1, model2,model3,model4,model5]];
        [self addSubview:introControll];

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
