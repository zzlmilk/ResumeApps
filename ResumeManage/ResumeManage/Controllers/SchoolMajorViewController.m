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
    
    
    _graduateTimeTextField.placeholder = @"毕业时间";
    _graduateTimeTextField.delegate = self;
    UIView *graduateTimePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _graduateTimeTextField.leftView =graduateTimePaddingView;
    _graduateTimeTextField.leftViewMode = UITextFieldViewModeAlways;
    _graduateTimeTextField.layer.borderWidth = 1.0f;
    _graduateTimeTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    
    datePicker = [[UIDatePicker alloc]init];
    dateLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    datePicker.locale = dateLocale;
    datePicker.backgroundColor =[UIColor whiteColor];
    datePicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    _graduateTimeTextField.inputView = datePicker;
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.backgroundColor = [UIColor whiteColor];
    UILabel *bgLabel = [[UILabel alloc]init];
    bgLabel.frame = CGRectMake(0, 0, 320, 44);
    bgLabel.backgroundColor = [UIColor clearColor];
    [toolBar addSubview:bgLabel];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                            action:@selector(cancelPicker)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexible,right,nil]  animated:YES];
    _schoolTextField.inputAccessoryView = toolBar;
    _majorTextField.inputAccessoryView = toolBar;
    _graduateTimeTextField.inputAccessoryView = toolBar;
    
}

//关闭选择日期 pickerView 并赋值 更新_graduateTimeTextField 数据
-(void) cancelPicker {
    
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:dateLocale];
        [formatter setDateFormat:dateFormat];
        [formatter setLocale:dateLocale];
        NSString *datePickertime =[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
        NSString *string1 = @"  ";
        _graduateTimeTextField.text = [string1 stringByAppendingString:datePickertime];
    
    [_schoolTextField resignFirstResponder];
    [_majorTextField resignFirstResponder];
    [_graduateTimeTextField resignFirstResponder];
    
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
