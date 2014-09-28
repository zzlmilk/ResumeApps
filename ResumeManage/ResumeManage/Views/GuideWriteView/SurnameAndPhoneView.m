//
//  SurnameAndPhoneView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-30.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "SurnameAndPhoneView.h"
#import "AHKActionSheet.h"

@implementation SurnameAndPhoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        _surnameArray = [[NSArray alloc]initWithObjects:@"李",
                           @"王",@"周",@"张",@"韩",@"刘",@"郑",
                           nil];
        
        //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ydbg4"]];
        
        surnamePhoneScrollView = [[UIScrollView alloc]init];
        surnamePhoneScrollView.frame = CGRectMake(0, 0,rectFrame.size.width, rectFrame.size.height);
        surnamePhoneScrollView.delegate = self;
        surnamePhoneScrollView.contentSize = CGSizeMake(rectFrame.size.width, rectFrame.size.height+50);
        [self addSubview:surnamePhoneScrollView];
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self    action:@selector(keyboardHide)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer: tapGestureRecognizer];
        [tapGestureRecognizer setCancelsTouchesInView:NO];
        
        
        UILabel *descriptionFourLabel = [[UILabel alloc]init];
        descriptionFourLabel.frame = CGRectMake(33, 87, rectFrame.size.width-65, 71);
        descriptionFourLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tishi4"]];
        [surnamePhoneScrollView addSubview:descriptionFourLabel];
        
        UILabel *surnameBorderLabel = [[UILabel alloc]init];
        surnameBorderLabel.frame = CGRectMake(37, 226, rectFrame.size.width-37, 38);
        surnameBorderLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dian2"]];
        [surnamePhoneScrollView addSubview:surnameBorderLabel];
        
        UILabel *oneNumberLabel = [[UILabel alloc]init];
        oneNumberLabel.frame = CGRectMake(45, 220, rectFrame.size.width-37, 38);
        oneNumberLabel.text = @"1";
        oneNumberLabel.textColor = [UIColor whiteColor];
        [surnamePhoneScrollView addSubview:oneNumberLabel];
        
        surnameText = [[UITextField alloc] initWithFrame:CGRectMake(80, 220, 200, 38)];
        [surnameText setBorderStyle:UITextBorderStyleNone];
        surnameText.tag = 1;
        surnameText.placeholder = @"你的姓";
        surnameText.delegate = self;
        surnameText.textColor = [UIColor whiteColor];
        [surnameText setValue:RGBACOLOR(255, 255, 255, 0.7f)
                        forKeyPath:@"_placeholderLabel.textColor"];
        [surnamePhoneScrollView addSubview:surnameText];
        
        UILabel *phoneBorderLabel = [[UILabel alloc]init];
        phoneBorderLabel.frame = CGRectMake(37, 326, rectFrame.size.width-37, 38);
        phoneBorderLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dian2"]];
        [surnamePhoneScrollView addSubview:phoneBorderLabel];
        
        phoneNumberText = [[UITextField alloc] initWithFrame:CGRectMake(80, rectFrame.size.width, 200, 38)];
        phoneNumberText.delegate = self;
        phoneNumberText.tag = 2;
        phoneNumberText.placeholder = @"你的联系电话";
        phoneNumberText.textColor = [UIColor whiteColor];
        [phoneNumberText setValue:RGBACOLOR(255, 255, 255, 0.7f)
                   forKeyPath:@"_placeholderLabel.textColor"];
        phoneNumberText.keyboardType = UIKeyboardTypeNumberPad;
        [phoneNumberText setBorderStyle:UITextBorderStyleNone];
        [surnamePhoneScrollView addSubview:phoneNumberText];
        
        UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, rectFrame.size.width, 44)];
        [topView setBarStyle:UIBarStyleDefault];
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(keyboardHide)];
        
        NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
        [topView setItems:buttonsArray];
        [surnameText setInputAccessoryView:topView];
        [phoneNumberText setInputAccessoryView:topView];
        
        
        UILabel *twoNumberLabel = [[UILabel alloc]init];
        twoNumberLabel.frame = CGRectMake(45, rectFrame.size.width, rectFrame.size.width-37, 38);
        twoNumberLabel.text = @"2";
        twoNumberLabel.textColor = [UIColor whiteColor];
        [surnamePhoneScrollView addSubview:twoNumberLabel];
    }
    return self;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //开始编辑时触发，文本字段将成为first responder
    
    if (textField.tag == 1) {
        
        [surnamePhoneScrollView setContentOffset:CGPointMake(0, 60) animated:YES];
    }else{
        
        [surnamePhoneScrollView setContentOffset:CGPointMake(0, 140) animated:YES];
    }
}

//隐藏键盘
-(void)keyboardHide{

    [surnameText resignFirstResponder];
    [phoneNumberText resignFirstResponder];

    [surnamePhoneScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
