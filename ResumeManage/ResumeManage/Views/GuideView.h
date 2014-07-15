//
//  GuideView.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol GuideViewDelegate <NSObject>

-(void)GuideDidFinish;

@end

@interface GuideView : UIView

@property(nonatomic,weak) id<GuideViewDelegate>delegate;

-(UIView *)guideTitleView:(CGRect)frame title:(NSString *)title;

@end
