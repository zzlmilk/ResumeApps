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
        descriptionFourLabel.frame = rectFrame;
        descriptionFourLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tu"]];
        [surnamePhoneScrollView addSubview:descriptionFourLabel];

        
        surnameText = [[UITextField alloc] initWithFrame:CGRectMake(90, 360, 200, 38)];
        [surnameText setBorderStyle:UITextBorderStyleNone];
        surnameText.tag = 1;
        surnameText.placeholder = @"你的姓名";
        surnameText.delegate = self;
        surnameText.backgroundColor = [UIColor clearColor];
        surnameText.textColor = [UIColor whiteColor];
        [surnameText setValue:RGBACOLOR(78, 145, 192, 1.0f)
                        forKeyPath:@"_placeholderLabel.textColor"];
        [surnamePhoneScrollView addSubview:surnameText];
        
        
        phoneNumberText = [[UITextField alloc] initWithFrame:CGRectMake(90, surnameText.frame.size.height+surnameText.frame.origin.y+35, 200, 38)];
        phoneNumberText.delegate = self;
        phoneNumberText.tag = 2;
        phoneNumberText.backgroundColor = [UIColor clearColor];
        phoneNumberText.placeholder = @"你的联系电话";
        phoneNumberText.textColor = [UIColor whiteColor];
        [phoneNumberText setValue:RGBACOLOR(78, 145, 192, 1.0f)
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
        
    }
    return self;
}

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{
    

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
