//
//  MajorAndHobbyView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MajorAndHobbyView : UIView<UIGestureRecognizerDelegate>
{
    UIButton *majorButton;
    UIButton *hobbyButton;
}

@property(nonatomic,strong)NSArray *majorArray;
@property(nonatomic,strong)NSArray *hobbyArray;

@property(nonatomic,strong)NSString *majorString;
@property(nonatomic,strong)NSString *hobbyString;

@end
