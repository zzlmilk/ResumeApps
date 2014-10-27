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

        tagButton = [[UIButton alloc]init];
        tagButton.frame = CGRectMake(90, 370, rectFrame.size.width-240, 35.5);
        tagButton.backgroundColor = [UIColor clearColor];
        [tagButton setTitle:@"添加标签" forState:UIControlStateNormal];
        [tagButton addTarget:self action:@selector(chooseTagAndPay:) forControlEvents:UIControlEventTouchUpInside];
        tagButton.tag = 5;
        tagButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [tagButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
        [self addSubview:tagButton];
        
        payButton = [[UIButton alloc]init];
        payButton.frame = CGRectMake(88, tagButton.frame.origin.y+tagButton.frame.size.height+35, rectFrame.size.width-200, 35.5);
        payButton.backgroundColor = [UIColor clearColor];
        [payButton setTitle:@"薪资要求" forState:UIControlStateNormal];
        [payButton addTarget:self action:@selector(chooseTagAndPay:) forControlEvents:UIControlEventTouchUpInside];
        payButton.tag = 6;
        [payButton setTitleEdgeInsets:UIEdgeInsetsMake(0,-30,0,0)];
        payButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18.0];
        [payButton setTitleColor:RGBACOLOR(78, 145, 192, 1.0f) forState:UIControlStateNormal];
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
                                        [tagButton setTitleColor:RGBACOLOR(96,96,96,1.0f) forState:UIControlStateNormal];
                                    }else{
                                        [payButton setTitle: loopArray[i] forState:UIControlStateNormal];
                                        [payButton setTitleColor:RGBACOLOR(96,96,96,1.0f) forState:UIControlStateNormal];
                                        
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
