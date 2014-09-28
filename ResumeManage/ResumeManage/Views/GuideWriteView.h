//
//  GuideWrite.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-28.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideWriteView : UIView


@property(nonatomic,weak) id delegate;


- (instancetype)initWithFrame:(CGRect)frame With:(id)_delegate;

@end
