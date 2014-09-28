//
//  HonorView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "HonorView.h"

@implementation HonorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        UILabel *honorTitle = [[UILabel alloc]init];
        honorTitle.frame = CGRectMake(0, 0, rectFrame.size.width, 40);
        honorTitle.backgroundColor = RGBACOLOR(137, 174, 211, 1);
        honorTitle.text = @"  获奖荣誉";
        honorTitle.font = [UIFont boldSystemFontOfSize:18.f];
        honorTitle.textColor = [UIColor whiteColor];
        [self addSubview:honorTitle];
        
        _honorContentTextView = [[UITextView alloc]init];
        _honorContentTextView.frame = CGRectMake(10, honorTitle.frame.size.height+honorTitle.frame.origin.y, rectFrame.size.width-20, 100);
        _honorContentTextView.backgroundColor = [UIColor clearColor];
        _honorContentTextView.font = [UIFont systemFontOfSize:16.f];
        _honorContentTextView.delegate = self;
        [self addSubview:_honorContentTextView];
        
        _honorPlaceholderLabel1 = [[UILabel alloc]init];
        _honorPlaceholderLabel1.frame = CGRectMake(15, honorTitle.frame.size.height+honorTitle.frame.origin.y +5, rectFrame.size.width-26, 30);
        _honorPlaceholderLabel1.backgroundColor = [UIColor clearColor];
        _honorPlaceholderLabel1.numberOfLines = 0;
        _honorPlaceholderLabel1.text = @"2011年 “天府新谷杯” 一等奖";
        _honorPlaceholderLabel1.textColor = RGBACOLOR(199, 199, 205, 1);
        [self addSubview:_honorPlaceholderLabel1];
        
        _honorPlaceholderLabel2 = [[UILabel alloc]init];
        _honorPlaceholderLabel2.frame = CGRectMake(15,_honorPlaceholderLabel1.frame.size.height+_honorPlaceholderLabel1.frame.origin.y, rectFrame.size.width-26, 30);
        _honorPlaceholderLabel2.backgroundColor = [UIColor clearColor];
        _honorPlaceholderLabel2.numberOfLines = 0;
        _honorPlaceholderLabel2.text = @"2012年 本学院”三好学生“奖";
        _honorPlaceholderLabel2.textColor = RGBACOLOR(199, 199, 205, 1);
        [self addSubview:_honorPlaceholderLabel2];
        
        _honorPlaceholderLabel3 = [[UILabel alloc]init];
        _honorPlaceholderLabel3.frame = CGRectMake(15, _honorPlaceholderLabel2.frame.size.height+_honorPlaceholderLabel2.frame.origin.y, rectFrame.size.width-26, 30);
        _honorPlaceholderLabel3.backgroundColor = [UIColor clearColor];
        _honorPlaceholderLabel3.numberOfLines = 0;
        _honorPlaceholderLabel3.text = @"2012年 本学院优秀”一等奖学金“";
        _honorPlaceholderLabel3.textColor = RGBACOLOR(199, 199, 205, 1);
        [self addSubview:_honorPlaceholderLabel3];

        
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
