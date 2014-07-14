//
//  ListTableViewCell.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ListTableViewCell.h"


#define kCircleR 30
#define kMargin 8


@implementation ListTableViewCell


#pragma mark -- Private
-(UIView *)circleViewNumber:(NSString*)number WithColor:(UIColor *)color{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kMargin, kMargin, kCircleR, kCircleR)];
    view.layer.cornerRadius = kCircleR/2.0;//设置那个圆角的有多圆
    view.layer.borderWidth = 0.8;//设置边框的宽度，可选
    view.layer.borderColor = [color CGColor];//设置边框的颜色
    view.layer.masksToBounds = YES;

    
    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectZero];
    label.frame = view.bounds;
    //label.center = view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:14.f];

    label.shadowOffset =CGSizeMake(0.1, 0.7f);
    label.shadowColor =  [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    
    

    label.text =@"0";
    [view addSubview:label];
    return view;
}

-(UIColor *)randomColor{
    
    defaultColor = [UIColor purpleColor];
    return defaultColor;
    
}

-(void)setResume:(Resume *)resume{
    if (resume) {
        [circleView removeFromSuperview];
        circleView =[self circleViewNumber:resume.personal.number WithColor:resume.personal.color];
        [self.contentView addSubview:circleView];
    
        titleLabel.text = resume.personal.title;
        titleLabel.textColor = resume.personal.color;
        
        if ([resume.personal isComplete]) {
            circleView.backgroundColor = resume.personal.color;
            titleLabel.textColor = [UIColor whiteColor];
        }

    }
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
        [self randomColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
       
        circleView = [self circleViewNumber:@"1" WithColor:defaultColor];
        [self.contentView addSubview:circleView];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMargin*2+circleView.frame.size.width, kMargin, 200, 30)];
        titleLabel.textColor  =defaultColor;
        

        titleLabel.shadowOffset =CGSizeMake(0, 0.7f);
        titleLabel.shadowColor =  [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
        
        
        titleLabel.text = @"个人信息";
        [self.contentView addSubview:titleLabel];
        
       
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
