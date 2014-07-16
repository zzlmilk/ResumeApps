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
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTap)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: tapGestureRecognizer];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    
    
    self.title = @"教育背景";
    _educationScrollView.frame = CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height);
    _educationScrollView.backgroundColor = [UIColor clearColor];
    _educationScrollView.delegate = self;
    [_educationScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+100)];
    [self.view addSubview:_educationScrollView];
    
    
    [_backButton addTarget:self action:@selector(backTopView) forControlEvents:UIControlEventTouchUpInside];
    
    
    _schoolNameTextField.placeholder = @"毕业院校";
    _schoolNameTextField.delegate = self;
    UIView *schoolPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _schoolNameTextField.leftView =schoolPaddingView;
    _schoolNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _schoolNameTextField.layer.borderWidth = 1.0f;
    _schoolNameTextField.tag = 1;
    _schoolNameTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    _majorNameTextField.placeholder = @"专业名称";
    _majorNameTextField.delegate = self;
    UIView *majorPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _majorNameTextField.leftView =majorPaddingView;
    _majorNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _majorNameTextField.layer.borderWidth = 1.0f;
    _majorNameTextField.tag = 2;
    _majorNameTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    _degreeTextField.placeholder = @"学历";
    _degreeTextField.delegate = self;
    UIView *degreePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _degreeTextField.leftView =degreePaddingView;
    _degreeTextField.leftViewMode = UITextFieldViewModeAlways;
    _degreeTextField.layer.borderWidth = 1.0f;
    _degreeTextField.tag = 3;
    _degreeTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    
    _graduateTimeTextField.placeholder = @"毕业时间";
    _graduateTimeTextField.delegate = self;
    UIView *graduatePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _graduateTimeTextField.leftView =graduatePaddingView;
    _graduateTimeTextField.leftViewMode = UITextFieldViewModeAlways;
    _graduateTimeTextField.layer.borderWidth = 1.0f;
    _graduateTimeTextField.tag = 4;
    _graduateTimeTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(backgroundTap)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    [topView setItems:buttonsArray];
    [_schoolNameTextField setInputAccessoryView:topView];
    [_majorNameTextField setInputAccessoryView:topView];
    [_degreeTextField setInputAccessoryView:topView];
    [_graduateTimeTextField setInputAccessoryView:topView];
    
}


//关闭键盘
- (void)backgroundTap{
    
    [_schoolNameTextField resignFirstResponder];
    [_majorNameTextField resignFirstResponder];
    [_degreeTextField resignFirstResponder];
    [_graduateTimeTextField resignFirstResponder];
    
    [_educationScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

// UITextField 得到焦点 视图滚动避免键盘遮挡
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 2:
            [_educationScrollView setContentOffset:CGPointMake(0, 30) animated:YES];
            break;
        case 3:
            [_educationScrollView setContentOffset:CGPointMake(0, 100) animated:YES];
            break;
        case 4:
            [_educationScrollView setContentOffset:CGPointMake(0, 200) animated:YES];
            break;
            
        default:
            break;
    }
    
}

//返回上一视图
-(void)backTopView{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
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
