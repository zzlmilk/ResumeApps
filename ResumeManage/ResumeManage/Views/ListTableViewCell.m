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
    

    label.text =number;
    [view addSubview:label];
    return view;
}



-(void)setResume:(Resume *)resume WithResumeAttribute:(resumeAttribute)attribute{
    
       
    if (resume ) {
        switch (attribute) {
            case PersonalAttribute:
                _title = resume.personal.title;
                _description = resume.personal.description;
                _color = resume.personal.color;
                _number = resume.personal.number;
                _isComplete = resume.personal.isComplete;
                break;
            case ObjectiveAttribute:
                _title = resume.objective.title;
                _description = resume.objective.description;
                _color = resume.objective.color;
                _number = resume.objective.number;
                _isComplete = resume.objective.isComplete;

            default:
                break;
        }
        
        
        [circleView removeFromSuperview];
        circleView =[self circleViewNumber:_number WithColor:_color];
        [self.contentView addSubview:circleView];
        titleLabel.text = _title;
        titleLabel.textColor = _color;
        if (_isComplete) {
            circleView.backgroundColor = _color;
            titleLabel.textColor = [UIColor whiteColor];
        }

    }
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        circleView = [self circleViewNumber:@"1" WithColor:nil];
        [self.contentView addSubview:circleView];
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMargin*2+circleView.frame.size.width, kMargin, 200, 30)];
        
        titleLabel.shadowOffset =CGSizeMake(0, 0.7f);
        titleLabel.shadowColor =  [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
        
        
//        titleLabel.text = @"";
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
