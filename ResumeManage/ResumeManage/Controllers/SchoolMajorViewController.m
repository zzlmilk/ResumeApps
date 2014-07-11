//
//  SchoolMajorViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-10.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "SchoolMajorViewController.h"

@interface SchoolMajorViewController ()

@end

@implementation SchoolMajorViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _schoolTextField.placeholder = @"毕业院校";
    _schoolTextField.delegate = self;
    UIView *schoolPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _schoolTextField.leftView =schoolPaddingView;
    _schoolTextField.leftViewMode = UITextFieldViewModeAlways;
    _schoolTextField.layer.borderWidth = 1.0f;
    _schoolTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    
    _majorTextField.placeholder = @"专业";
    _majorTextField.delegate = self;
    UIView *majorPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _majorTextField.leftView =majorPaddingView;
    _majorTextField.leftViewMode = UITextFieldViewModeAlways;
    _majorTextField.layer.borderWidth = 1.0f;
    _majorTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    
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
