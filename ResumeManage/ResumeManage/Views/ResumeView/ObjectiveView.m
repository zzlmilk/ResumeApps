//
//  ObjectiveView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ObjectiveView.h"

@implementation ObjectiveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        UILabel *objectiveTitleLabel = [[UILabel alloc]init];
        objectiveTitleLabel.frame = CGRectMake(0, 0, rectFrame.size.width, 40);
        objectiveTitleLabel.backgroundColor = RGBACOLOR(144, 199, 217, 1);
        objectiveTitleLabel.text = @"  求职意向";
        objectiveTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        objectiveTitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:objectiveTitleLabel];
        //工作性质
        UILabel *lineLabel7 = [[UILabel alloc]init];
        lineLabel7.frame = CGRectMake(10, objectiveTitleLabel.frame.origin.y + objectiveTitleLabel.frame.size.height +50, rectFrame.size.width - 10, 1);
        lineLabel7.backgroundColor = RGBACOLOR(219, 219, 219, 1);
        [self addSubview:lineLabel7];
        
        UILabel *workTitlelabel = [[UILabel alloc]init];
        workTitlelabel.backgroundColor = [UIColor clearColor];
        workTitlelabel.frame = CGRectMake(20, objectiveTitleLabel.frame.origin.y + objectiveTitleLabel.frame.size.height, 100, 50);
        workTitlelabel.text= @"工作性质";
        workTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
        [self addSubview:workTitlelabel];
        
        _workTextField= [[UITextField alloc]init];
        _workTextField.delegate = self;
        _workTextField.placeholder = @"全职";
        _workTextField.enabled= NO;
        _workTextField.borderStyle = UITextBorderStyleNone;
        _workTextField.backgroundColor = [UIColor clearColor];
        _workTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
        _workTextField.frame = CGRectMake(workTitlelabel.frame.size.width+20, workTitlelabel.frame.origin.y, rectFrame.size.width-workTitlelabel.frame.size.width-workTitlelabel.frame.origin.x-30, 50);
        [self addSubview:_workTextField];
        
        UILabel *imageRightLabel3 = [[UILabel alloc]init];
        imageRightLabel3.frame = CGRectMake(_workTextField.frame.size.width+_workTextField.frame.origin.x+5, _workTextField.frame.origin.y+_workTextField.frame.size.height-30, 10,12);
        imageRightLabel3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon-arrow-right"]];
        //imageRightLabel1.backgroundColor = [UIColor clearColor];
        [self addSubview:imageRightLabel3];
        
        //期望薪资
        UILabel *lineLabel8 = [[UILabel alloc]init];
        lineLabel8.frame = CGRectMake(10, objectiveTitleLabel.frame.origin.y + objectiveTitleLabel.frame.size.height +100, rectFrame.size.width - 10, 1);
        lineLabel8.backgroundColor = RGBACOLOR(219, 219, 219, 1);
        [self addSubview:lineLabel8];
        
        UILabel *salaryTitlelabel = [[UILabel alloc]init];
        salaryTitlelabel.backgroundColor = [UIColor clearColor];
        salaryTitlelabel.frame = CGRectMake(20, objectiveTitleLabel.frame.origin.y + objectiveTitleLabel.frame.size.height +50, 100, 50);
        salaryTitlelabel.text= @"期望薪资";
        workTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
        [self addSubview:salaryTitlelabel];
        
        _salaryTextField= [[UITextField alloc]init];
        _salaryTextField.delegate = self;
        _salaryTextField.placeholder = @"请选择";
        _salaryTextField.enabled = NO;
        _salaryTextField.borderStyle = UITextBorderStyleNone;
        _salaryTextField.backgroundColor = [UIColor clearColor];
        _salaryTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
        _salaryTextField.frame = CGRectMake(workTitlelabel.frame.size.width+20, workTitlelabel.frame.origin.y + 50, rectFrame.size.width-workTitlelabel.frame.size.width-workTitlelabel.frame.origin.x-30, 50);
        [self addSubview:_salaryTextField];
        
        UILabel *imageRightLabel4 = [[UILabel alloc]init];
        imageRightLabel4.frame = CGRectMake(_salaryTextField.frame.size.width+_salaryTextField.frame.origin.x+5, _salaryTextField.frame.origin.y+_salaryTextField.frame.size.height-30, 10,12);
        imageRightLabel4.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon-arrow-right"]];
        //imageRightLabel1.backgroundColor = [UIColor clearColor];
        [self addSubview:imageRightLabel4];
        
        //职位名称
        UILabel *lineLabel9 = [[UILabel alloc]init];
        lineLabel9.frame = CGRectMake(10, objectiveTitleLabel.frame.origin.y + objectiveTitleLabel.frame.size.height +150, rectFrame.size.width - 10, 1);
        lineLabel9.backgroundColor = RGBACOLOR(219, 219, 219, 1);
        [self addSubview:lineLabel9];
        
        UILabel *positionTitlelabel = [[UILabel alloc]init];
        positionTitlelabel.backgroundColor = [UIColor clearColor];
        positionTitlelabel.frame = CGRectMake(20, objectiveTitleLabel.frame.origin.y + objectiveTitleLabel.frame.size.height +100, 100, 50);
        positionTitlelabel.text= @"职位名称";
        positionTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
        [self addSubview:positionTitlelabel];
        
        _positionTextField= [[UITextField alloc]init];
        _positionTextField.delegate = self;
        _positionTextField.placeholder = @"请选择";
        _positionTextField.enabled = NO;
        _positionTextField.borderStyle = UITextBorderStyleNone;
        _positionTextField.backgroundColor = [UIColor clearColor];
        _positionTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
        _positionTextField.frame = CGRectMake(workTitlelabel.frame.size.width+20, workTitlelabel.frame.origin.y + 100, rectFrame.size.width-workTitlelabel.frame.size.width-workTitlelabel.frame.origin.x-30, 50);
        [self addSubview:_positionTextField];
        
        UILabel *imageRightLabel5 = [[UILabel alloc]init];
        imageRightLabel5.frame = CGRectMake(_positionTextField.frame.size.width+_positionTextField.frame.origin.x+5, _positionTextField.frame.origin.y+_positionTextField.frame.size.height-30, 10,12);
        imageRightLabel5.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon-arrow-right"]];
        //imageRightLabel1.backgroundColor = [UIColor clearColor];
        [self addSubview:imageRightLabel5];
        
       
        

        
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
