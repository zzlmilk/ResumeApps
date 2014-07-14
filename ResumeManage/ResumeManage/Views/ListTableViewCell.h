//
//  ListTableViewCell.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resume.h"


@interface ListTableViewCell : UITableViewCell
{
    UIView *circleView;
    UILabel *titleLabel;
    
    
    
    
 
}


@property(nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *description;
@property(nonatomic,strong) NSString *number;
@property(nonatomic,strong) UIColor *color;
@property                   BOOL  isComplete;



@property(nonatomic,strong)Resume *resume;

-(void)setResume:(Resume *)resume WithResumeAttribute:(resumeAttribute)attribute;





@end
