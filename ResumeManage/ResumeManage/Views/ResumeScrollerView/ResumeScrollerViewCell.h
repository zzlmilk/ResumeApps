//
//  ResumeScrollerViewCell.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrowClick.h"


#define kCCHeaderHeight 50


@interface ResumeScrollerViewCell : UIView
{
    
}


@property(nonatomic,strong)UIView *titleView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *titleButton;
@property(nonatomic,strong) ArrowClick *arrowClick;


@property(nonatomic,strong)UIView *contentView;

@property(nonatomic)BOOL isClicked;
@property(nonatomic) int index;

//init
+ (ResumeScrollerViewCell *)newResumeScrollerViewCellWithTitle:(NSString *)title index:(int)index content:(UIView *)content;


@end
