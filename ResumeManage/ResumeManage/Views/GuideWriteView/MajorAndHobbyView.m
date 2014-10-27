//
//  MajorAndHobbyView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "MajorAndHobbyView.h"
#import "AHKActionSheet.h"
#import "Industry.h"
#import "GenderAboutndustryView.h"

#import "FVCustomAlertView.h"

@implementation MajorAndHobbyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        
        _majorArray = [[NSArray alloc]initWithObjects:@"计算机网络",
                       @"计算机应用",@"软件技术",@"电子商务",@"工商企业管理",@"UI设计",@"土木工程",@"建筑环境与能源应用工程",@"给排水科学与工程",@"建筑电气与智能化",nil];
        
        _hobbyArray = [[NSArray alloc]initWithObjects:@"体 育",
                       @"看 书", @"旅 游",@"美 食",@"画 画",@"唱 歌",
                       @"跳 舞",@"电视剧",nil];
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        majorButton = [[UIButton alloc]init];
        majorButton.frame = CGRectMake(92, 370, rectFrame.size.width-80, 35.5);
        majorButton.backgroundColor = [UIColor clearColor];
        [majorButton setTitle:@"你的专业" forState:UIControlStateNormal];
        [majorButton addTarget:self action:@selector(chooseMajorAndHobbyList:) forControlEvents:UIControlEventTouchUpInside];
        majorButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        majorButton.tag = 1;
        majorButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [majorButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
        [self addSubview:majorButton];
        
        hobbyButton = [[UIButton alloc]init];
        hobbyButton.frame = CGRectMake(90, 440, rectFrame.size.width-240, 35.5);
        [hobbyButton setTitle:@"你的爱好" forState:UIControlStateNormal];
        [hobbyButton addTarget:self action:@selector(chooseMajorAndHobbyList:) forControlEvents:UIControlEventTouchUpInside];
        hobbyButton.backgroundColor = [UIColor clearColor];
        hobbyButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
         [hobbyButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
        [self addSubview:hobbyButton];
    }
    return self;
}


//显示选择列表
-(void)chooseMajorAndHobbyList:(UIButton *)sender{
    UIButton *chooseButton = (UIButton *)sender;
    
    NSArray *loopArray;
    
    if (chooseButton.tag ==1) {
        loopArray = _majorArray;
    }else{
        
        loopArray = _hobbyArray;
    }
    
    AHKActionSheet *actionSheet = [[AHKActionSheet alloc] initWithTitle:NSLocalizedString(nil, nil)];
    
    for (int i =0; i < loopArray.count; i++) {
        
        NSString *projectList = loopArray[i];
        
        [actionSheet addButtonWithTitle:NSLocalizedString(projectList, nil)
                                  image:nil
                                   type:AHKActionSheetButtonTypeDefault
                                handler:^(AHKActionSheet *as) {
                                    
                                    if (chooseButton.tag ==1) {
                                        [majorButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                        [majorButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
                                        _majorString =loopArray[i];
                                        [self getGenderAboutDustry];
                                        
                                    }else{
                                        
                                    [hobbyButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                    [hobbyButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
                                        _hobbyString =loopArray[i];
                                        [self getGenderAboutDustry];
                                    }

                                }];
        
    }
    
    [actionSheet show];
    
}

-(void)getGenderAboutDustry{
    
    [FVCustomAlertView showDefaultLoadingAlertOnView:self withTitle:@"Loading..."];
    //[FVCustomAlertView hideAlertFromView:self fading:YES];

    if (_majorString.length > 0 && _hobbyString.length > 0) {
        
        NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
//        [dic setObject:@"21" forKey:@"count"];
        
        [Industry getGenderAndIndustryParameters:dic WithBlock:^(Industry *industry, Error *e) {
            
            NSString *genderString = industry.genderString;
            NSArray *heightIndustryArray = industry.heightIndustryArray;
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:genderString forKey:@"genderString"];
            
            for (int i=0; i<heightIndustryArray.count; i++) {
                NSString *statusString = [heightIndustryArray objectAtIndex:i];
            [userDefaults setObject:statusString forKey:@"heightIndustryString"];
            }

        }];
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
