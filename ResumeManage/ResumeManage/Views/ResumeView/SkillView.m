//
//  SkillView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "SkillView.h"

@implementation SkillView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        UILabel *skillTitleLabel = [[UILabel alloc]init];
        skillTitleLabel.frame = CGRectMake(0, 0, rectFrame.size.width, 40);
        skillTitleLabel.backgroundColor = RGBACOLOR(149, 219, 129, 1);
        skillTitleLabel.text = @"  专业技能";
        skillTitleLabel.font = [UIFont boldSystemFontOfSize:18.f];
        skillTitleLabel.textColor = [UIColor whiteColor];
        [self addSubview:skillTitleLabel];
        
        _skillContentTextView = [[UITextView alloc]init];
        _skillContentTextView.frame = CGRectMake(10, skillTitleLabel.frame.size.height+skillTitleLabel.frame.origin.y, rectFrame.size.width-20, 100);
        _skillContentTextView.backgroundColor = [UIColor clearColor];
        _skillContentTextView.font = [UIFont systemFontOfSize:16.f];
        _skillContentTextView.delegate = self;
        [self addSubview:_skillContentTextView];
        
        _skillPlaceholderLabel = [[UILabel alloc]init];
        _skillPlaceholderLabel.frame = CGRectMake(15, skillTitleLabel.frame.size.height+skillTitleLabel.frame.origin.y-10, rectFrame.size.width-26, 100);
        _skillPlaceholderLabel.numberOfLines = 0;
        _skillPlaceholderLabel.text = @"熟练掌握PhotoShop,FireWorks,Flash,Offic等办公软件。";
        _skillPlaceholderLabel.textColor = RGBACOLOR(199, 199, 205, 1);
        [self addSubview:_skillPlaceholderLabel];

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
