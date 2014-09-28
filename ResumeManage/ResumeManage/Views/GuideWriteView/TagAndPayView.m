//
//  TagAndPayView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-31.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "TagAndPayView.h"
#import "AHKActionSheet.h"
#import "LeadWriteViewController.h"
@implementation TagAndPayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _tagArray = [[NSArray alloc]initWithObjects:@"踏 实",
                       @"幽 默",@"有创造力",@"有为青年",@"学 霸",@"美 女",
                       @"女神经",@"女屌丝",nil];
        
        _payArray = [[NSArray alloc]initWithObjects:@"1000-2000", @"2000-4000",@"4000-6000",@"6000-8000",@"8000以上",nil];
        
//         self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing5"]];
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;

        UILabel *descriptionOneLabel = [[UILabel alloc]init];
        descriptionOneLabel.frame = CGRectMake(25, 100, rectFrame.size.width-70, 72);
        descriptionOneLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tishiyu5"]];
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
        
        tagButton = [[UIButton alloc]init];
        tagButton.frame = CGRectMake(72, 222, rectFrame.size.width-240, 35.5);
        [tagButton setTitle:@"添加标签" forState:UIControlStateNormal];
        [tagButton addTarget:self action:@selector(chooseTagAndPay:) forControlEvents:UIControlEventTouchUpInside];
        tagButton.tag = 5;
        tagButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [tagButton setTitleColor:RGBACOLOR(255, 255, 255, 0.7f) forState:UIControlStateNormal];
        [self addSubview:tagButton];
        
        
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
        
        payButton = [[UIButton alloc]init];
        payButton.frame = CGRectMake(72, 322, rectFrame.size.width-200, 35.5);
        [payButton setTitle:@"薪资要求" forState:UIControlStateNormal];
        [payButton addTarget:self action:@selector(chooseTagAndPay:) forControlEvents:UIControlEventTouchUpInside];
        payButton.tag = 6;
        [payButton setTitleEdgeInsets:UIEdgeInsetsMake(0,-30,0,0)];
        payButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [payButton setTitleColor:[UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:0.7f] forState:UIControlStateNormal];
        [self addSubview:payButton];
        
        
        UIButton *skipListButton = [[UIButton alloc]init];
        skipListButton.frame = CGRectMake(rectFrame.size.width-70, rectFrame.size.height-70, 50, 50);
        [skipListButton setImage:[UIImage imageNamed:@"qianjinbtn"] forState:UIControlStateNormal];
        [skipListButton addTarget:self action:@selector(skipList) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:skipListButton];
        
    }
    return self;
}

-(void)skipList{


    if ([self.delegate respondsToSelector:@selector(TagAndPaySkipFinish)])
    {
        [self.delegate TagAndPaySkipFinish];
    }
    
    [self.delegate TagAndPaySkipFinish];
    
}

//显示选择列表
-(void)chooseTagAndPay:(UIButton *)sender{
    
    UIButton *chooseButton = (UIButton *)sender;
    
    NSArray *loopArray;
    
    if (chooseButton.tag ==5) {
        loopArray = _tagArray;
    }else{
        
        loopArray = _payArray;
    }
    
    AHKActionSheet *actionSheet = [[AHKActionSheet alloc] initWithTitle:NSLocalizedString(nil, nil)];
    
    for (int i =0; i < loopArray.count; i++) {
        
        NSString *projectList = loopArray[i];
        
        [actionSheet addButtonWithTitle:NSLocalizedString(projectList, nil)
                                  image:nil
                                   type:AHKActionSheetButtonTypeDefault
                                handler:^(AHKActionSheet *as) {
                                    
                                    if (chooseButton.tag ==5) {
                                        [tagButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                        [tagButton setTitleColor:RGBACOLOR(255, 255, 255, 1.0f) forState:UIControlStateNormal];
                                    }else{
                                        [payButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                        [payButton setTitleColor:RGBACOLOR(255, 255, 255, 1.0f) forState:UIControlStateNormal];
                                        
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
