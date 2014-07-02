//
//  HomeViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-6-24.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic)IBOutlet UIScrollView *homeScrollView;

@property (strong, nonatomic)IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic)IBOutlet UITextField *nameTextField;
@property (strong, nonatomic)IBOutlet UISegmentedControl *genderSegmentedControl;
@property (strong, nonatomic)IBOutlet UITextField *ageTextField;
@property (strong, nonatomic)IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic)IBOutlet UITextField *emailTextField;
@property (strong, nonatomic)IBOutlet UIButton *savePersonInfoAndNextButton;



@end
