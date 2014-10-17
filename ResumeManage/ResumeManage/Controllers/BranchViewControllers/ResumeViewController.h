//
//  ResumeViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-22.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "SocialView.h"
#import "HonorView.h"
#import "ObjectiveView.h"
#import "SkillView.h"
#import "AssessmentView.h"

@interface ResumeViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (nonatomic,strong) NSArray *majorArray;  //专业
@property (nonatomic,strong) NSArray *educationArray;  //学历


@property (nonatomic,strong) IBOutlet UIScrollView *resumeScrollView;

@property (nonatomic,strong) UIView *personalView;//基本概况
@property (nonatomic,strong) UISegmentedControl *SexSegmentedControl;
@property (strong, nonatomic) UIImageView *avatarImageView;
@property (strong, nonatomic) UITextField *nameTextField;
@property (strong, nonatomic) UITextField* ageTextField;
@property (strong, nonatomic) UITextField* schoolTextField;
@property (strong, nonatomic) UITextField* educationTextField;
@property (strong, nonatomic) UITextField* majorTextField;
@property (strong, nonatomic) UITextField* phoneTextField;
@property (strong, nonatomic) UITextField* emailTextField;

@property (nonatomic,strong)SocialView *socialView;
@property (nonatomic,strong)HonorView *honorView;
@property (nonatomic,strong)ObjectiveView *objectiveView;
@property (nonatomic,strong)SkillView *skillView;
@property (nonatomic,strong)AssessmentView *assessmentView;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *previewItem;

- (IBAction)previewResumeinfo;

- (IBAction)showMenu;

@end
