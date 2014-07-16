//
//  HomeViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-6-24.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end


@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self    action:@selector(backgroundTap)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: tapGestureRecognizer];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.title = @"个人信息";
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor whiteColor],
                                NSForegroundColorAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    _homeScrollView.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    _homeScrollView.backgroundColor = [UIColor clearColor];
    _homeScrollView.delegate = self;
    [_homeScrollView setContentSize:CGSizeMake(320, self.view.frame.size.height+100)];
    [self.view addSubview:_homeScrollView];
    
    _backButton.backgroundColor = [UIColor clearColor];
    [_backButton addTarget:self action:@selector(backTopView) forControlEvents:UIControlEventTouchUpInside];
    
    _avatarImageView.image = [UIImage imageNamed:@"headerDefult"];
    _avatarImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImageView)];
    [_avatarImageView addGestureRecognizer:singleTap];
    
    [_nameTextField setBorderStyle:UITextBorderStyleLine];
    _nameTextField.placeholder = @"姓 名";
    _nameTextField.delegate = self;
    _nameTextField.tag = 1;
    UIView *namePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _nameTextField.leftView =namePaddingView;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.layer.borderWidth = 1.0f;
    _nameTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    [_ageTextField setBorderStyle:UITextBorderStyleLine];
    _ageTextField.placeholder = @"年 龄";
    _ageTextField.delegate = self;
    _ageTextField.keyboardType = UIKeyboardTypeNumberPad;
    _ageTextField.tag = 2;
    UIView *agePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _ageTextField.leftView =agePaddingView;
    _ageTextField.leftViewMode = UITextFieldViewModeAlways;
    _ageTextField.layer.borderWidth = 1.0f;
    _ageTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    
    [_phoneTextField setBorderStyle:UITextBorderStyleLine];
    _phoneTextField.placeholder = @"手 机";
    _phoneTextField.delegate = self;
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextField.tag = 3;
    UIView *phonePaddingView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _phoneTextField.leftView =phonePaddingView;
    _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    _phoneTextField.layer.borderWidth = 1.0f;
    _phoneTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    [_emailTextField setBorderStyle:UITextBorderStyleLine];
    _emailTextField.placeholder = @"邮 箱";
    _emailTextField.delegate = self;
    _emailTextField.tag = 4;
    UIView *emailPaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _emailTextField.leftView =emailPaddingView;
    _emailTextField.leftViewMode = UITextFieldViewModeAlways;
    _emailTextField.layer.borderWidth = 1.0f;
    _emailTextField.layer.borderColor = [[UIColor colorWithRed:214/255.f green:214/255.f blue:214/255.f alpha:1.0f] CGColor];
    
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(backgroundTap)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    [topView setItems:buttonsArray];
    [_nameTextField setInputAccessoryView:topView];
    [_ageTextField setInputAccessoryView:topView];
    [_phoneTextField setInputAccessoryView:topView];
    [_emailTextField setInputAccessoryView:topView];

 }

//返回上一视图
-(void)backTopView{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

//关闭键盘
- (void)backgroundTap{
    
    [_nameTextField resignFirstResponder];
    [_ageTextField resignFirstResponder];
    [_phoneTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
    
    [_homeScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

//从年龄开始 UITextField 得到焦点 视图滚动避免键盘遮挡
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 1:
            [_homeScrollView setContentOffset:CGPointMake(0, 10) animated:YES];
            break;
        case 2:
            [_homeScrollView setContentOffset:CGPointMake(0, 100) animated:YES];
            break;
        case 3:
            [_homeScrollView setContentOffset:CGPointMake(0, 170) animated:YES];
            break;
        case 4:
            [_homeScrollView setContentOffset:CGPointMake(0, 220) animated:YES];
            break;
            
        default:
            break;
    }
    
}




// 调用相机
-(void)onClickImageView{

    UIActionSheet *sheet;

    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])

    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"设置头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"设置头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    sheet.tag = 255;
    [sheet showInView:self.view];

}

// 跳转到相机 或 相册界面
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {

        NSUInteger sourceType = 0;

        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
     
        }
  
        else {

            if (buttonIndex == 0) {

                return;
       
            } else {
         
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
            }
      
        }

        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];

        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }
}


// 实现 picker delegte 
#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [self saveImage:image withName:@"currentImage.png"];

    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];

    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];

   // isFullScreen = NO;
    [_avatarImageView setImage:savedImage];

    _avatarImageView.tag = 100;

}


#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
