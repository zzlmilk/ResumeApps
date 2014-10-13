//
//  SocialView.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-25.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "SocialView.h"

@implementation SocialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self    action:@selector(backgroundTap)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer: tapGestureRecognizer];
        [tapGestureRecognizer setCancelsTouchesInView:NO];
        
        
        CGRect rectFrame = [ UIScreen mainScreen ].applicationFrame;
        
        //社会实践

        UILabel *sociallTitle = [[UILabel alloc]init];
        sociallTitle.frame = CGRectMake(0, 0, rectFrame.size.width, 40);
        sociallTitle.backgroundColor = RGBACOLOR(93, 150, 191, 1);
        sociallTitle.text = @"  社会实践";
        sociallTitle.font = [UIFont boldSystemFontOfSize:18.f];
        sociallTitle.textColor = [UIColor whiteColor];
        [self addSubview:sociallTitle];
        
        _socialContentTextView = [[UITextView alloc]init];
        _socialContentTextView.frame = CGRectMake(10, sociallTitle.frame.size.height+sociallTitle.frame.origin.y, rectFrame.size.width-40, 100);
        _socialContentTextView.backgroundColor = [UIColor clearColor];
        _socialContentTextView.font = [UIFont systemFontOfSize:16.f];
        _socialContentTextView.delegate = self;
        [self addSubview:_socialContentTextView];
        
        _socialPlaceholderLabel = [[UILabel alloc]init];
        _socialPlaceholderLabel.frame = CGRectMake(15, sociallTitle.frame.size.height+sociallTitle.frame.origin.y, rectFrame.size.width-26, 100);
        _socialPlaceholderLabel.numberOfLines = 0;
        _socialPlaceholderLabel.text = @"经历了一周的社会实践,我感慨颇多,我们见识到了社会的真实一面,实践生活中每一天遇到的情况还在我脑海里回旋,它给我们带来了意想不到的效果。";
        _socialPlaceholderLabel.textColor = RGBACOLOR(199, 199, 205, 1);
        
        [self addSubview:_socialPlaceholderLabel];
        
    }
    return self;
}

- (void)textViewDidChange:(UITextView *)textView{
    
    _socialPlaceholderLabel.text = @"";
    
}

//关闭键盘
- (void)backgroundTap{
    
    [_socialContentTextView resignFirstResponder];
    
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
