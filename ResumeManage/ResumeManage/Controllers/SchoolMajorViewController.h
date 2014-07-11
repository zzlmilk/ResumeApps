//
//  SchoolMajorViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-10.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolMajorViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic)IBOutlet UITextField *schoolTextField;//学校
@property (strong, nonatomic)IBOutlet UITextField *majorTextField;//专业

@property (strong, nonatomic)IBOutlet UIButton *saveSchoolMajorAndNextButton;


@end
