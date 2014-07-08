//
//  JobWishViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-7.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "JobWishViewController.h"
#import "HomeViewController.h"

@interface JobWishViewController ()

@end


@implementation JobWishViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self    action:@selector(keyboardHide)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: tapGestureRecognizer];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    
    self.title = @"求职意向";
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor whiteColor],
                                NSForegroundColorAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    _jobWishScrollView.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    _jobWishScrollView.backgroundColor = [UIColor clearColor];
    _jobWishScrollView.delegate = self;
    [self.view addSubview:_jobWishScrollView];
    
    
    [_jobKindTextField setBorderStyle:UITextBorderStyleLine];
    _jobKindTextField.placeholder = @"工作性质";
    _jobKindTextField.delegate = self;
    _jobKindTextField.tag = 1;
    UIView *jobKindPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _jobKindTextField.leftView =jobKindPaddingView;
    _jobKindTextField.leftViewMode = UITextFieldViewModeAlways;
    _jobKindTextField.layer.borderWidth = 1.0f;
    _jobKindTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    [_jobNameTextField setBorderStyle:UITextBorderStyleLine];
    _jobNameTextField.placeholder = @"职位名称";
    _jobNameTextField.delegate = self;
    _jobNameTextField.tag = 2;
    UIView *jobNamePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _jobNameTextField.leftView =jobNamePaddingView;
    _jobNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _jobNameTextField.layer.borderWidth = 1.0f;
    _jobNameTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    [_wishMoneyTextField setBorderStyle:UITextBorderStyleLine];
    _wishMoneyTextField.placeholder = @"期望薪金";
    _wishMoneyTextField.delegate = self;
    _wishMoneyTextField.tag = 3;
    UIView *wishMoneyPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _wishMoneyTextField.leftView =wishMoneyPaddingView;
    _wishMoneyTextField.leftViewMode = UITextFieldViewModeAlways;
    _wishMoneyTextField.layer.borderWidth = 1.0f;
    _wishMoneyTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    [_jobStatusTextField setBorderStyle:UITextBorderStyleLine];
    _jobStatusTextField.placeholder = @"求职状态";
    _jobStatusTextField.delegate = self;
    _jobStatusTextField.tag = 3;
    UIView *jobStatusPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _jobStatusTextField.leftView =jobStatusPaddingView;
    _jobStatusTextField.leftViewMode = UITextFieldViewModeAlways;
    _jobStatusTextField.layer.borderWidth = 1.0f;
    _jobStatusTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(keyboardHide)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    [topView setItems:buttonsArray];
    [_jobKindTextField setInputAccessoryView:topView];
    [_jobNameTextField setInputAccessoryView:topView];
    [_wishMoneyTextField setInputAccessoryView:topView];
    [_jobStatusTextField setInputAccessoryView:topView];
    
}


-(void)keyboardHide{
    
    [_jobKindTextField resignFirstResponder];
    [_jobNameTextField resignFirstResponder];
    [_wishMoneyTextField resignFirstResponder];
    [_jobStatusTextField resignFirstResponder];
    
}

// 使用自动布局 ScrollView的ContentSize 会被重置和屏幕一样， 此方法进行解决
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_jobWishScrollView setContentSize:CGSizeMake(320, self.view.frame.size.height+100)];
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
