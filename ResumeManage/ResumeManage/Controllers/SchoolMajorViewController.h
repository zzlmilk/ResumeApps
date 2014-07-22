//
//  SchoolMajorViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-10.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"



@interface SchoolMajorViewController : BaseViewController<UITextFieldDelegate,UIScrollViewDelegate>
{
    
    NSLocale *dateLocale;
    UIDatePicker *datePicker;
    
}





@property (strong, nonatomic)IBOutlet UIScrollView *schoolMajorScrollView;
@property (strong, nonatomic)IBOutlet UITextField *schoolTextField;//学校
@property (strong, nonatomic)IBOutlet UITextField *majorTextField;//专业
@property (strong, nonatomic)IBOutlet UITextField *graduateTimeTextField;//毕业时间


@property (strong, nonatomic)IBOutlet UIButton *saveSchoolMajorAndNextButton;


@end
