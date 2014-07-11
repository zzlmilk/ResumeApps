//
//  EducationViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-9.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@end

@implementation EducationViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"教育背景";
    _educationScrollView.frame = CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height);
    _educationScrollView.backgroundColor = [UIColor clearColor];
    _educationScrollView.delegate = self;
    [self.view addSubview:_educationScrollView];
    
    
    _schoolNameTextField.placeholder = @"毕业院校";
    _schoolNameTextField.delegate = self;
    UIView *schoolPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _schoolNameTextField.leftView =schoolPaddingView;
    _schoolNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _schoolNameTextField.layer.borderWidth = 1.0f;
    _schoolNameTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    _majorNameTextField.placeholder = @"专业名称";
    _majorNameTextField.delegate = self;
    UIView *majorPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _majorNameTextField.leftView =majorPaddingView;
    _majorNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _majorNameTextField.layer.borderWidth = 1.0f;
    _majorNameTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    _degreeTextField.placeholder = @"学历";
    _degreeTextField.delegate = self;
    UIView *degreePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _degreeTextField.leftView =degreePaddingView;
    _degreeTextField.leftViewMode = UITextFieldViewModeAlways;
    _degreeTextField.layer.borderWidth = 1.0f;
    _degreeTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    
    _graduateTimeTextField.placeholder = @"毕业时间";
    _graduateTimeTextField.delegate = self;
    UIView *graduatePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _graduateTimeTextField.leftView =graduatePaddingView;
    _graduateTimeTextField.leftViewMode = UITextFieldViewModeAlways;
    _graduateTimeTextField.layer.borderWidth = 1.0f;
    _graduateTimeTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
}

// 使用自动布局 ScrollView的ContentSize 会被重置和屏幕一样， 此方法进行解决
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_educationScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+100)];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
