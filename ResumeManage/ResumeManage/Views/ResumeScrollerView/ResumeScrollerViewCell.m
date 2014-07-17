//
//  ResumeScrollerViewCell.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumeScrollerViewCell.h"
#import "Colours.h"

@implementation ResumeScrollerViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    _titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, kCCHeaderHeight)];
       
        
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(9 ,7, 268, 35)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [_titleView addSubview:_titleLabel];
        
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.frame = CGRectMake(0, 0, 320, kCCHeaderHeight);
        
    _arrowClick = [[ArrowClick alloc]initWithFrame:CGRectMake(288, 18, 16, 16)];
    _arrowClick.arrowColor = [UIColor cornflowerColor];
        
    [_titleView addSubview:_arrowClick];
    [_titleView addSubview:_titleButton];
    [_titleView addSubview:_titleLabel];
        
        
        
    [self addSubview:_titleView];
        
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:_contentView];
        
        
    }
    return self;
}

+(ResumeScrollerViewCell*)newResumeScrollerViewCellWithTitle:(NSString *)title index:(int)index content:(UIView *)content{
    ResumeScrollerViewCell *cell  = [[ResumeScrollerViewCell alloc]initWithFrame:CGRectMake(0, 0, 320, kCCHeaderHeight)];
    cell.titleLabel.text = title;
    cell.index = index;
    cell.titleButton.tag = index;
            
    cell.contentView.frame = CGRectMake(cell.contentView.frame.origin.x, cell.contentView.frame.origin.y, content.frame.size.width, content.frame.size.height);
    
    cell.clipsToBounds = YES;  //非常重要
    
    [cell.contentView addSubview:content];
    
    
    
    return cell;
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
