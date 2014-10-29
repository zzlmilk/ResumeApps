//
//  ResumeViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-22.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumeViewController.h"
#import "AHKActionSheet.h"
#import "DefaultTempViewController.h"

#import "ResumeInfo.h"


@interface ResumeViewController ()

@end

UITextField *editTextField;

@implementation ResumeViewController

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
    
    _majorArray = [[NSArray alloc]initWithObjects:@"计算机",
                   @"管 理",@"工 程",@"法 学",@"历 史",@"教 育",
                   @"医 疗",nil];
    _educationArray = [[NSArray alloc]initWithObjects:@"中 专",
                   @"高 中",@"大 专",@"本 科",@"研究生",@"博 士",
                   @"其 他",nil];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self    action:@selector(backgroundTap)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer: tapGestureRecognizer];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    
    
    _resumeScrollView.delegate = self;
    [_resumeScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+850)];
    [self.view addSubview:_resumeScrollView];
    

    _personalView = [[UIView alloc]init];
    _personalView.frame = CGRectMake(0, 64, self.view.frame.size.width, 450);
    _personalView.backgroundColor = [UIColor clearColor];
    
    
    UILabel *personalTitle = [[UILabel alloc]init];
    personalTitle.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    personalTitle.backgroundColor = RGBACOLOR(78, 119, 167, 1);
    personalTitle.text = @"  基本概况";
    personalTitle.font = [UIFont boldSystemFontOfSize:18.f];
    personalTitle.textColor = [UIColor whiteColor];
    [_personalView addSubview:personalTitle];
    
    _avatarImageView = [[UIImageView alloc]init];
    _avatarImageView.image = [UIImage imageNamed:@"touxiangz"];
    _avatarImageView.frame = CGRectMake(20, 60, 70, 70);
    _avatarImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImageView)];
    [_avatarImageView addGestureRecognizer:singleTap];
    [_personalView addSubview:_avatarImageView];
    
    _nameTextField = [[UITextField alloc]init];
    _nameTextField.borderStyle = UITextBorderStyleLine;
    _nameTextField.layer.borderColor = RGBACOLOR(219, 219, 219, 1).CGColor;
    _nameTextField.layer.borderWidth = 1.0;
    _nameTextField.textAlignment =UIControlContentHorizontalAlignmentRight;
    _nameTextField.frame = CGRectMake(_avatarImageView.frame.origin.x+_avatarImageView.frame.size.width+15, _avatarImageView.frame.origin.y, 200, 35);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    _nameTextField.text = [userDefaults stringForKey:@"yd_surnameString"];
    _nameTextField.placeholder = @"请输入姓名  ";
    _nameTextField.delegate = self;
    UIView *namePaddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 40)];
    _nameTextField.rightView =namePaddingView;
    _nameTextField.rightViewMode = UITextFieldViewModeAlways;
    _nameTextField.backgroundColor = RGBACOLOR(255, 255, 255, 0.7f);
    [_personalView addSubview:_nameTextField];
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"男",@"女",nil];
    _SexSegmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    _SexSegmentedControl.layer.borderColor = RGBACOLOR(219, 219, 219, 1).CGColor;
    _SexSegmentedControl.tintColor =RGBACOLOR(118, 173, 207, 1);
    _SexSegmentedControl.layer.cornerRadius = 4.0f;
    _SexSegmentedControl.layer.masksToBounds = YES;
    _SexSegmentedControl.layer.borderWidth = 1.0f;
    _SexSegmentedControl.frame = CGRectMake(_avatarImageView.frame.origin.x+_avatarImageView.frame.size.width+15, _avatarImageView.frame.origin.y+_nameTextField.frame.size.height+5, 200, 32);
//    _SexSegmentedControl.selectedSegmentIndex = 1;
    [_personalView addSubview:_SexSegmentedControl];
    [_SexSegmentedControl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    
    //年龄
    UILabel *lineLabel1 = [[UILabel alloc]init];
    lineLabel1.frame = CGRectMake(10, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +20, self.view.frame.size.width - 10, 1);
    lineLabel1.backgroundColor = RGBACOLOR(219, 219, 219, 1);
    [_personalView addSubview:lineLabel1];
    UILabel *ageTitlelabel = [[UILabel alloc]init];
    ageTitlelabel.backgroundColor = [UIColor clearColor];
    ageTitlelabel.frame = CGRectMake(20, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +20, 100, 50);
    ageTitlelabel.text= @"年龄";
    ageTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
    [_personalView addSubview:ageTitlelabel];
    
    _ageTextField = [[UITextField alloc]init];
    _ageTextField.delegate = self;
    _ageTextField.placeholder = @"24";
    _ageTextField.borderStyle = UITextBorderStyleNone;
    _ageTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
    _ageTextField.frame = CGRectMake(ageTitlelabel.frame.size.width+ageTitlelabel.frame.origin.x+10, ageTitlelabel.frame.origin.y, self.view.frame.size.width-ageTitlelabel.frame.size.width-ageTitlelabel.frame.origin.x-40, 50);
    [_personalView addSubview:_ageTextField];
    //学校
    UILabel *lineLabel2 = [[UILabel alloc]init];
    lineLabel2.frame = CGRectMake(10, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +70, self.view.frame.size.width - 10, 1);
    lineLabel2.backgroundColor = RGBACOLOR(219, 219, 219, 1);
    [_personalView addSubview:lineLabel2];
    UILabel *schoolTitlelabel = [[UILabel alloc]init];
    schoolTitlelabel.backgroundColor = [UIColor clearColor];
    schoolTitlelabel.frame = CGRectMake(20, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +70, 100, 50);
    schoolTitlelabel.text= @"学校";
    schoolTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
    [_personalView addSubview:schoolTitlelabel];
    
    _schoolTextField = [[UITextField alloc]init];
    _schoolTextField.delegate = self;
    _schoolTextField.placeholder = @"上海大学";
    _schoolTextField.borderStyle = UITextBorderStyleNone;
    _schoolTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
    _schoolTextField.frame = CGRectMake(ageTitlelabel.frame.size.width+ageTitlelabel.frame.origin.x+10, ageTitlelabel.frame.origin.y+50, self.view.frame.size.width-ageTitlelabel.frame.size.width-ageTitlelabel.frame.origin.x-40, 50);
    [_personalView addSubview:_schoolTextField];
    //学历
    UILabel *lineLabel3 = [[UILabel alloc]init];
    lineLabel3.frame = CGRectMake(10, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +120, self.view.frame.size.width - 10, 1);
    lineLabel3.backgroundColor = RGBACOLOR(219, 219, 219, 1);
    [_personalView addSubview:lineLabel3];
    
    UILabel *educationTitlelabel = [[UILabel alloc]init];
    educationTitlelabel.backgroundColor = [UIColor clearColor];
    educationTitlelabel.frame = CGRectMake(20, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height+120, 100, 50);
    educationTitlelabel.text= @"学历";
    educationTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
    [_personalView addSubview:educationTitlelabel];
    
    _educationTextField = [[UITextField alloc]init];
    _educationTextField.delegate = self;
    _educationTextField.placeholder = @"本科";
    _educationTextField.borderStyle = UITextBorderStyleNone;
    _educationTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
    _educationTextField.tag = 102;
    _educationTextField.frame = CGRectMake(ageTitlelabel.frame.size.width+ageTitlelabel.frame.origin.x+10, ageTitlelabel.frame.origin.y+100, self.view.frame.size.width-ageTitlelabel.frame.size.width-ageTitlelabel.frame.origin.x-40, 50);
    [_personalView addSubview:_educationTextField];
    
    UILabel *imageRightLabel1 = [[UILabel alloc]init];
    imageRightLabel1.frame = CGRectMake(_educationTextField.frame.size.width+_educationTextField.frame.origin.x+5, _educationTextField.frame.origin.y+_educationTextField.frame.size.height-30, 10,12);
    imageRightLabel1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon-arrow-right"]];
    //imageRightLabel1.backgroundColor = [UIColor clearColor];
    [_personalView addSubview:imageRightLabel1];
    
    //专业
    UILabel *lineLabel4 = [[UILabel alloc]init];
    lineLabel4.frame = CGRectMake(10, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +170, self.view.frame.size.width - 10, 1);
    lineLabel4.backgroundColor = RGBACOLOR(219, 219, 219, 1);
    [_personalView addSubview:lineLabel4];
    
    UILabel *majorTitlelabel = [[UILabel alloc]init];
    majorTitlelabel.backgroundColor = [UIColor clearColor];
    majorTitlelabel.frame = CGRectMake(20, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height+170, 100, 50);
    majorTitlelabel.text= @"专业";
    majorTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
    [_personalView addSubview:majorTitlelabel];
    
    _majorTextField = [[UITextField alloc]init];
    _majorTextField.delegate = self;
    _majorTextField.placeholder = @"艺术设计";
    _majorTextField.tag = 101;
    _majorTextField.borderStyle = UITextBorderStyleNone;
    _majorTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
    _majorTextField.frame = CGRectMake(ageTitlelabel.frame.size.width+ageTitlelabel.frame.origin.x+10, ageTitlelabel.frame.origin.y+150, self.view.frame.size.width-ageTitlelabel.frame.size.width-ageTitlelabel.frame.origin.x-40, 50);
    [_personalView addSubview:_majorTextField];
    
    UILabel *imageRightLabel2 = [[UILabel alloc]init];
    imageRightLabel2.frame = CGRectMake(_majorTextField.frame.size.width+_majorTextField.frame.origin.x+5, _majorTextField.frame.origin.y+_majorTextField.frame.size.height-30, 10,12);
    imageRightLabel2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon-arrow-right"]];
    //imageRightLabel1.backgroundColor = [UIColor clearColor];
    [_personalView addSubview:imageRightLabel2];
    
    //电话
    UILabel *lineLabel5 = [[UILabel alloc]init];
    lineLabel5.frame = CGRectMake(10, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +220, self.view.frame.size.width - 10, 1);
    lineLabel5.backgroundColor = RGBACOLOR(219, 219, 219, 1);
    [_personalView addSubview:lineLabel5];
    
    UILabel *phoneTitlelabel = [[UILabel alloc]init];
    phoneTitlelabel.backgroundColor = [UIColor clearColor];
    phoneTitlelabel.frame = CGRectMake(20, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height+220, 100, 50);
    phoneTitlelabel.text= @"联系方式";
    phoneTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
    [_personalView addSubview:phoneTitlelabel];
    
    _phoneTextField = [[UITextField alloc]init];
    _phoneTextField.delegate = self;
    _phoneTextField.placeholder = @"13501870124";
    _phoneTextField.borderStyle = UITextBorderStyleNone;
    _phoneTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
    _phoneTextField.frame = CGRectMake(ageTitlelabel.frame.size.width+ageTitlelabel.frame.origin.x+10, ageTitlelabel.frame.origin.y+200, self.view.frame.size.width-ageTitlelabel.frame.size.width-ageTitlelabel.frame.origin.x-40, 50);
    [_personalView addSubview:_phoneTextField];
    //邮箱
    UILabel *lineLabel6 = [[UILabel alloc]init];
    lineLabel6.frame = CGRectMake(10, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height +270, self.view.frame.size.width - 10, 1);
    lineLabel6.backgroundColor = RGBACOLOR(219, 219, 219, 1);
    [_personalView addSubview:lineLabel6];
    
    UILabel *emailTitlelabel = [[UILabel alloc]init];
    emailTitlelabel.backgroundColor = [UIColor clearColor];
    emailTitlelabel.frame = CGRectMake(20, _SexSegmentedControl.frame.origin.y + _SexSegmentedControl.frame.size.height+270, 100, 50);
    emailTitlelabel.text= @"邮箱";
    emailTitlelabel.textColor = RGBACOLOR(81, 81, 81, 1);
    [_personalView addSubview:emailTitlelabel];
    
    _emailTextField= [[UITextField alloc]init];
    _emailTextField.delegate = self;
    _emailTextField.placeholder = @"example@email.com";
    _emailTextField.borderStyle = UITextBorderStyleNone;
    _emailTextField.textAlignment=UIControlContentHorizontalAlignmentRight;
    _emailTextField.frame = CGRectMake(ageTitlelabel.frame.size.width+ageTitlelabel.frame.origin.x-10, ageTitlelabel.frame.origin.y+250, self.view.frame.size.width-ageTitlelabel.frame.size.width-ageTitlelabel.frame.origin.x-20, 50);
    [_personalView addSubview:_emailTextField];
    [_resumeScrollView addSubview:_personalView];
    
    
    
    //社会实践---
    _socialView= [[SocialView alloc]init];
    _socialView.frame = CGRectMake(0, ageTitlelabel.frame.origin.y+366, self.view.frame.size.width, 160);
    _socialView.backgroundColor = [UIColor clearColor];
    [_resumeScrollView addSubview:_socialView];
    
    //获奖荣誉---
    _honorView= [[HonorView alloc]init];
    _honorView.frame = CGRectMake(0, _socialView.frame.origin.y+_socialView.frame.size.height, self.view.frame.size.width, 140);
    _honorView.backgroundColor = [UIColor clearColor];
    [_resumeScrollView addSubview:_honorView];
    
    //求职意向---
    _objectiveView = [[ObjectiveView alloc]init];
    _objectiveView.frame = CGRectMake(0, _honorView.frame.origin.y+_honorView.frame.size.height, self.view.frame.size.width, 200);
    _objectiveView.backgroundColor = [UIColor clearColor];
    [_resumeScrollView addSubview:_objectiveView];
    
    //专业技能---
    _skillView = [[SkillView alloc]init];
    _skillView.frame = CGRectMake(0, _objectiveView.frame.size.height+_objectiveView.frame.origin.y-10, self.view.frame.size.width, 200);
    _skillView.backgroundColor = [UIColor clearColor];
    [_resumeScrollView addSubview:_skillView];
    
    //个人评价---
    _assessmentView = [[AssessmentView alloc]init];
    _assessmentView.frame = CGRectMake(0,_skillView.frame.size.height+_skillView.frame.origin.y, self.view.frame.size.width, 200);
    _assessmentView.backgroundColor = [UIColor clearColor];
    [_resumeScrollView addSubview:_assessmentView];
    
}


-(void)changeSegment:(UISegmentedControl*)sender
{
   // NSInteger index = sender.selectedSegmentIndex;

}
//关闭键盘
- (void)backgroundTap{
    
    [_nameTextField resignFirstResponder];
    [_ageTextField resignFirstResponder];
    [_schoolTextField resignFirstResponder];
    [_educationTextField resignFirstResponder];
    [_majorTextField resignFirstResponder];
    [_phoneTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    //返回一个BOOL值，指定是否循序文本字段开始编辑
    BOOL able = YES;
    
    editTextField = (UITextField *)textField;
    
    NSArray *loopArray;
    
    if (editTextField.tag ==101) {
        
        loopArray = _majorArray;
        able = !able;
        [self chooseList:(NSArray*)loopArray];
        
    }else if(editTextField.tag ==102){
        
        loopArray = _educationArray;
        able = !able;
        [self chooseList:(NSArray*)loopArray];
    }
    
    return able;

}
//更改引导页信息 List选择
-(void)chooseList:(NSArray*)loopArray{
    
    AHKActionSheet *actionSheet = [[AHKActionSheet alloc] initWithTitle:NSLocalizedString(nil, nil)];
    
    for (int i =0; i < loopArray.count; i++) {
        
        NSString *projectList = loopArray[i];
        
        [actionSheet addButtonWithTitle:NSLocalizedString(projectList, nil)
                                  image:nil
                                   type:AHKActionSheetButtonTypeDefault
                                handler:^(AHKActionSheet *as) {
                                    
                                    if (editTextField.tag ==101) {
                                        
                                        _majorTextField.text = loopArray[i];
                                        
                                    }else{
                                        _educationTextField.text = loopArray[i];
                                    }
                                    
                                }];
        
    }
    
    [actionSheet show];
    
}


- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

// 调用相机
-(void)onClickImageView{
    
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"设置头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择",nil];
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

//获取简历信息 并向Server端发送 保存简历 换取html模版信息
-(IBAction)previewResumeinfo{
    
    DefaultTempViewController *DefaultTempVC = [self.storyboard instantiateViewControllerWithIdentifier:@"defaultTempViewController"];
    [self.navigationController pushViewController:DefaultTempVC animated:YES];
    
//    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
//    
//    [dic setObject:@"13222223333" forKey:@"user_phone"];
//    [dic setObject:@"姓名" forKey:@"user_name"];
//    [dic setObject:@"19891001" forKey:@"user_birthday"];
//    [dic setObject:@"1" forKey:@"user_sex"];//1,2
//    [dic setObject:@"1" forKey:@"school_id"];
//    [dic setObject:@"2" forKey:@"education_id"];
//    [dic setObject:@"3" forKey:@"compensation_id"];
//    [dic setObject:@"4" forKey:@"major_detail_id"];
//    [dic setObject:@"专业技能" forKey:@"professional_skill"];
//    [dic setObject:@"社会经历" forKey:@"social_practice"];
//    [dic setObject:@"获奖荣誉" forKey:@"honor"];
//    [dic setObject:@"个人评价" forKey:@"self_evaluation"];
//    
////      [dic setObject:@"1" forKey:@"user_id"];
////      [dic setObject:@"1" forKey:@"template_id"];
//   
//    [ResumeInfo saveResumeInfoParameters:dic WithBlock:^(ResumeInfo *resumeInfo, Error *e) {
//        
//        DefaultTempViewController *DefaultTempVC = [self.storyboard instantiateViewControllerWithIdentifier:@"defaultTempViewController"];
//        [self.navigationController pushViewController:DefaultTempVC animated:YES];
//        
//    }];
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
