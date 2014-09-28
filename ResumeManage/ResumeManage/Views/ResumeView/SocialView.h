//
//  SocialView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

//社会实践

@interface SocialView : UIView<UITextViewDelegate>

@property (nonatomic,strong) UITextView *socialContentTextView;
@property (nonatomic,strong) UILabel *socialPlaceholderLabel;

@end
