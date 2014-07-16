//
//  JobWishViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-7.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "JobWishViewController.h"

@interface JobWishViewController ()

@property(nonatomic,strong)NSArray *jobCategoryArray;
@property(nonatomic,strong)NSArray *jobNameArray;
@property(nonatomic,strong)NSArray *wishMoneyArray;
@property(nonatomic,strong)NSArray *jobStatusArray;

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
    
    self.jobCategoryArray = @[@"全职",@"兼职"];
    self.jobNameArray = @[@"PHP工程师",@"IOS工程师",@"UI网页设计师"];
    self.wishMoneyArray = @[@"2000-4000",@"4000-6000",@"6000-8000",@"8000-10000"
                            ,@"10000+"];
    self.jobStatusArray = @[@"在职",@"离职",@"其他"];
    
    
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
    [_jobWishScrollView setContentSize:CGSizeMake(320, self.view.frame.size.height+100)];
    [self.view addSubview:_jobWishScrollView];
    
    
    [_backButton addTarget:self action:@selector(backTopView) forControlEvents:UIControlEventTouchUpInside];
    
    
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
    _jobStatusTextField.tag = 4;
    UIView *jobStatusPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _jobStatusTextField.leftView =jobStatusPaddingView;
    _jobStatusTextField.leftViewMode = UITextFieldViewModeAlways;
    _jobStatusTextField.layer.borderWidth = 1.0f;
    _jobStatusTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(keyboardHide)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    [topView setItems:buttonsArray];
    [_jobKindTextField setInputAccessoryView:topView];
    [_jobNameTextField setInputAccessoryView:topView];
    [_wishMoneyTextField setInputAccessoryView:topView];
    [_jobStatusTextField setInputAccessoryView:topView];
    
    
    _jobCategoryPickerView = [[UIPickerView alloc]init];
    _jobCategoryPickerView.backgroundColor =[UIColor whiteColor];
    _jobCategoryPickerView.delegate = self;
    _jobCategoryPickerView.tag = 1;
    _jobKindTextField.inputView = _jobCategoryPickerView;
    
    _jobNamePickerView = [[UIPickerView alloc]init];
    _jobNamePickerView.backgroundColor =[UIColor whiteColor];
    _jobNamePickerView.delegate = self;
    _jobNamePickerView.tag = 2;
    _jobNameTextField.inputView = _jobNamePickerView;
    
    _wishMoneyPickerView = [[UIPickerView alloc]init];
    _wishMoneyPickerView.backgroundColor =[UIColor whiteColor];
    _wishMoneyPickerView.delegate = self;
    _wishMoneyPickerView.tag = 3;
    _wishMoneyTextField.inputView = _wishMoneyPickerView;
    
    _jobStatusPickerView = [[UIPickerView alloc]init];
    _jobStatusPickerView.backgroundColor =[UIColor whiteColor];
    _jobStatusPickerView.delegate = self;
    _jobStatusPickerView.tag = 4;
    _jobStatusTextField.inputView = _jobStatusPickerView;
    
    
    
}

//返回第component列的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    NSInteger pickerCount;
    
    switch (pickerView.tag) {
        case 1:
            pickerCount = self.jobCategoryArray.count;
            break;
        case 2:
            pickerCount = self.jobNameArray.count;
            break;
        case 3:
            pickerCount = self.wishMoneyArray.count;
            break;
        case 4:
            pickerCount = self.jobStatusArray.count;
            break;
            
        default:
            break;
    }
    
    return pickerCount;
    
}

//返回第component列内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *componentContent;
    
    switch (pickerView.tag) {
        case 1:
            componentContent = self.jobCategoryArray[row];
            break;
        case 2:
            componentContent = self.jobNameArray[row];
            break;
        case 3:
            componentContent = self.wishMoneyArray[row];
            break;
        case 4:
            componentContent = self.jobStatusArray[row];
            break;
            
        default:
            break;
    }
    
    
    return componentContent;

}
#pragma mark 返回列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}




//返回上一视图
-(void)backTopView{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

//隐藏键盘  关闭 datePicker
-(void)keyboardHide{

    [_jobKindTextField resignFirstResponder];
    [_jobNameTextField resignFirstResponder];
    [_wishMoneyTextField resignFirstResponder];
    [_jobStatusTextField resignFirstResponder];
    
    [_jobWishScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}


// UITextField 得到焦点 视图滚动避免键盘遮挡
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 1:

            break;
        case 3:
            [_jobWishScrollView setContentOffset:CGPointMake(0, 80) animated:YES];
            break;
        case 4:
            [_jobWishScrollView setContentOffset:CGPointMake(0, 110) animated:YES];
            break;
            
        default:
            break;
    }
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
