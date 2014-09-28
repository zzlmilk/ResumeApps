//
//  HonorView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

//获奖荣誉

@interface HonorView : UIView<UITextViewDelegate>

@property (nonatomic,strong) UITextView *honorContentTextView;
@property (nonatomic,strong) UILabel *honorPlaceholderLabel1;
@property (nonatomic,strong) UILabel *honorPlaceholderLabel2;
@property (nonatomic,strong) UILabel *honorPlaceholderLabel3;

@end
