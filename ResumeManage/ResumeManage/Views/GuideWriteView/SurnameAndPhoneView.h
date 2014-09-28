//
//  SurnameAndPhoneView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-30.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurnameAndPhoneView : UIView<UITextFieldDelegate,UIScrollViewDelegate>
{
    UITextField *surnameText;
    UITextField *phoneNumberText;
    UIScrollView *surnamePhoneScrollView;

}
@property(nonatomic,strong)NSArray *surnameArray;

@end
