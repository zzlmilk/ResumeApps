//
//  ObjectiveView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

//求职意向

@interface ObjectiveView : UIView<UITextFieldDelegate>

@property (strong, nonatomic) UITextField* workTextField;
@property (strong, nonatomic) UITextField* salaryTextField;
@property (strong, nonatomic) UITextField* positionTextField;

@end
