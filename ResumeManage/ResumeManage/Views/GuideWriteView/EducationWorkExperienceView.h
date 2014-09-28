//
//  EducationWorkExperienceView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-30.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EducationWorkExperienceView : UIView
{
    UIButton *workExperienceButton;
    UIButton *educationButton ;
}

@property(nonatomic,strong)NSArray *educationArray;
@property(nonatomic,strong)NSArray *workExperienceArray;


@end
