//
//  AssessmentView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "AssessmentView.h"

@implementation AssessmentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        UILabel *assessmentTitleLabel = [[UILabel alloc]init];
        assessmentTitleLabel.frame = CGRectMake(0, 0, rectFrame.size.width, 40);
        assessmentTitleLabel.backgroundColor = RGBACOLOR(140, 216, 170, 1);
        assessmentTitleLabel.text = @"  个人评价";
        assessmentTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        assessmentTitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:assessmentTitleLabel];
        
        _assessmentContentTextView = [[UITextView alloc]init];
        _assessmentContentTextView.frame = CGRectMake(10, assessmentTitleLabel.frame.size.height+assessmentTitleLabel.frame.origin.y, rectFrame.size.width-20, 170);
        _assessmentContentTextView.backgroundColor = [UIColor clearColor];
        _assessmentContentTextView.font = [UIFont systemFontOfSize:16.f];
        _assessmentContentTextView.delegate = self;
        [self addSubview:_assessmentContentTextView];
        
        _assessmentPlaceholderLabel = [[UILabel alloc]init];
        _assessmentPlaceholderLabel.frame = CGRectMake(15, assessmentTitleLabel.frame.size.height+assessmentTitleLabel.frame.origin.y-30, rectFrame.size.width-26, 200);
        _assessmentPlaceholderLabel.numberOfLines = 0;
        _assessmentPlaceholderLabel.text = @"本人性格热情开朗，待人友好，为人诚实谦虚。工作勤奋，认真负责，能吃苦耐劳，尽职尽责，有耐心。具有亲和力，平易近人，善于与人沟通。学习刻苦认真，成绩优秀，名列前茅。品学兼优，连续三年获得学院奖学金。";
        _assessmentPlaceholderLabel.textColor = RGBACOLOR(199, 199, 205, 1);
        [self addSubview:_assessmentPlaceholderLabel];

        
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
