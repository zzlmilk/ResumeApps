//
//  SkillView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

//专业技能

@interface SkillView : UIView<UITextViewDelegate>

@property (nonatomic,strong) UITextView *skillContentTextView;
@property (nonatomic,strong) UILabel *skillPlaceholderLabel;

@end
