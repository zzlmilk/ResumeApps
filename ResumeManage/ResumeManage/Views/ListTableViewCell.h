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
    
    
    UIColor *defaultColor ;
   
    
}


@property(nonatomic,strong)Resume *resume;


-(UIColor *)randomColor;




@end
