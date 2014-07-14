//
//  JobWishViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-7.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobWishViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic)IBOutlet UIScrollView *jobWishScrollView;

@property (strong, nonatomic)IBOutlet UITextField *jobKindTextField;
@property (strong, nonatomic)IBOutlet UITextField *jobNameTextField;
@property (strong, nonatomic)IBOutlet UITextField *wishMoneyTextField;
@property (strong, nonatomic)IBOutlet UITextField *jobStatusTextField;

@property (strong, nonatomic)IBOutlet UIButton *saveJobwishAndNextButton;

@property (strong, nonatomic)IBOutlet UIButton *backButton;

@end
