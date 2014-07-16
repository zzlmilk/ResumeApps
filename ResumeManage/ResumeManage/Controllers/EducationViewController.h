//
//  EducationViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-9.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface EducationViewController : BaseViewController<UIScrollViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic)IBOutlet UIScrollView *educationScrollView;

@property (strong, nonatomic)IBOutlet UITextField *schoolNameTextField;
@property (strong, nonatomic)IBOutlet UITextField *majorNameTextField;//专业
@property (strong, nonatomic)IBOutlet UITextField *degreeTextField;//学历
@property (strong, nonatomic)IBOutlet UITextField *graduateTimeTextField;//毕业时间

@property (strong, nonatomic)IBOutlet UIButton *saveEducationAndNextButton;

@property (strong, nonatomic)IBOutlet UIButton *backButton;

@end
