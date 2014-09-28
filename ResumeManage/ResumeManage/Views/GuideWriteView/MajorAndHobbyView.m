//
//  MajorAndHobbyView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "MajorAndHobbyView.h"
#import "AHKActionSheet.h"

@implementation MajorAndHobbyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        
        _majorArray = [[NSArray alloc]initWithObjects:@"计算机",
                       @"管 理",@"工 程",@"法 学",@"历 史",@"教 育",
                       @"医 疗",nil];
        
        _hobbyArray = [[NSArray alloc]initWithObjects:@"体 育",
                       @"看 书", @"旅 游",@"美 食",@"画 画",@"唱 歌",
                       @"跳 舞",@"电视剧",nil];
        

        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;

        UILabel *descriptionOneLabel = [[UILabel alloc]init];
        descriptionOneLabel.frame = CGRectMake(25, 100, rectFrame.size.width-70, 61);
        descriptionOneLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wenzi"]];
        [self addSubview:descriptionOneLabel];
        
        UILabel *promptBorderLabel = [[UILabel alloc]init];
        promptBorderLabel.frame = CGRectMake(37, 227, rectFrame.size.width-37, 38);
        promptBorderLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dian"]];
        [self addSubview:promptBorderLabel];
        
        UILabel *oneNumberLabel = [[UILabel alloc]init];
        oneNumberLabel.frame = CGRectMake(44, 220, 10, 35.5);
        oneNumberLabel.text = @"1";
        oneNumberLabel.textColor = [UIColor whiteColor];
        oneNumberLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:oneNumberLabel];
        
        
        majorButton = [[UIButton alloc]init];
        majorButton.frame = CGRectMake(72, 222, rectFrame.size.width-240, 35.5);
        [majorButton setTitle:@"你的专业" forState:UIControlStateNormal];
        [majorButton addTarget:self action:@selector(chooseMajorAndHobbyList:) forControlEvents:UIControlEventTouchUpInside];
        majorButton.tag = 1;
        majorButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [majorButton setTitleColor:RGBACOLOR(255, 255, 255, 0.7f) forState:UIControlStateNormal];
        [self addSubview:majorButton];
        
        UILabel *hobbyBorderLabel = [[UILabel alloc]init];
        hobbyBorderLabel.frame = CGRectMake(37, 327,rectFrame.size.width-37, 38);
        hobbyBorderLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dian"]];
        [self addSubview:hobbyBorderLabel];
        
        UILabel *twoNumberLabel = [[UILabel alloc]init];
        twoNumberLabel.frame = CGRectMake(44, 320, 10, 35.5);
        twoNumberLabel.text = @"2";
        twoNumberLabel.textColor = [UIColor whiteColor];
        twoNumberLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:twoNumberLabel];
    
        
        hobbyButton = [[UIButton alloc]init];
        hobbyButton.frame = CGRectMake(72, 322, rectFrame.size.width-240, 35.5);
        [hobbyButton setTitle:@"你的爱好" forState:UIControlStateNormal];
        [hobbyButton addTarget:self action:@selector(chooseMajorAndHobbyList:) forControlEvents:UIControlEventTouchUpInside];
        hobbyBorderLabel.tag = 2;
        hobbyButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [hobbyButton setTitleColor:[UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:0.7f] forState:UIControlStateNormal];
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
                                        [majorButton setTitleColor:RGBACOLOR(255, 255, 255, 1.0f) forState:UIControlStateNormal];
                                        _majorString =loopArray[i];
                                        
                                         NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                                         [userDefaults setObject:_majorString forKey:@"majorDataString"];
                                        
                                    }else{
                                    [hobbyButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                    [hobbyButton setTitleColor:RGBACOLOR(255, 255, 255, 1.0f) forState:UIControlStateNormal];
                                        _hobbyString =loopArray[i];
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
