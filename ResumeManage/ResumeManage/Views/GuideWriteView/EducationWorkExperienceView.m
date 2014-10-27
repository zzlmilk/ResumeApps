//
//  EducationWorkExperienceView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-30.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "EducationWorkExperienceView.h"
#import "AHKActionSheet.h"

@implementation EducationWorkExperienceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //均从1 开始
        _educationArray = [[NSArray alloc]initWithObjects:@"初中",
                           @"高中",@"中技",@"中专",@"大专",@"本科",@"MBA",@"硕士",@"博 士",@"其 他",@"保 密",
                           nil];
        
        _workExperienceArray =[[NSArray alloc]initWithObjects:@"从0开始",
                               @"1年左右",@"1-3年",@"5年以上",nil];
        
        //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing3"]];
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        
        educationButton = [[UIButton alloc]init];
        educationButton.frame = CGRectMake(50, 365, rectFrame.size.width-170, 35.5);
        educationButton.backgroundColor = [UIColor clearColor];
        [educationButton setTitle:@"你的学历" forState:UIControlStateNormal];
        [educationButton addTarget:self action:@selector(chooseEducationAndWorkExperienceList:) forControlEvents:UIControlEventTouchUpInside];
        //[educationButton setTitleEdgeInsets:UIEdgeInsetsMake(0,-40,0,0)];
        educationButton.tag = 3;
        educationButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [educationButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
        [self addSubview:educationButton];
        

        workExperienceButton = [[UIButton alloc]init];
        workExperienceButton.frame = CGRectMake(50, educationButton.frame.size.height+educationButton.frame.origin.y+35, 150, 35.5);
        workExperienceButton.backgroundColor = [UIColor clearColor];
        [workExperienceButton setTitle:@"工作经验" forState:UIControlStateNormal];
        [workExperienceButton addTarget:self action:@selector(chooseEducationAndWorkExperienceList:) forControlEvents:UIControlEventTouchUpInside];
        workExperienceButton.tag = 4;
        workExperienceButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [workExperienceButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
        [self addSubview:workExperienceButton];
        
    }
    return self;
}


//选择学历和工作经验
-(void)chooseEducationAndWorkExperienceList:(UIButton *)sender{

    UIButton *chooseButton = (UIButton *)sender;
    
    NSArray *loopArray;
    
    if (chooseButton.tag ==3) {
        loopArray = _educationArray;
    }else{
        
        loopArray = _workExperienceArray;
    }
    
    AHKActionSheet *actionSheet = [[AHKActionSheet alloc] initWithTitle:NSLocalizedString(nil, nil)];
    
    for (int i =0; i < loopArray.count; i++) {
        
        NSString *projectList = loopArray[i];
        
        [actionSheet addButtonWithTitle:NSLocalizedString(projectList, nil)
                                  image:nil
                                   type:AHKActionSheetButtonTypeDefault
                                handler:^(AHKActionSheet *as) {
                                    
                                    if (chooseButton.tag ==3) {
                                        [educationButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                        [educationButton setTitleColor:RGBACOLOR(96,96,96,1.0f) forState:UIControlStateNormal];
                                    }else{
                                        [workExperienceButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                        [workExperienceButton setTitleColor:RGBACOLOR(96,96,96,1.0f) forState:UIControlStateNormal];
                                        
                                    }
                                    
                                }];
        
    }
    
    [actionSheet show];
    
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
