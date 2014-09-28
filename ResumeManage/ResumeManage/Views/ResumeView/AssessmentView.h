//
//  AssessmentView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

//个人评价

@interface AssessmentView : UIView<UITextViewDelegate>

@property (nonatomic,strong) UITextView *assessmentContentTextView;
@property (nonatomic,strong) UILabel *assessmentPlaceholderLabel;

@end
