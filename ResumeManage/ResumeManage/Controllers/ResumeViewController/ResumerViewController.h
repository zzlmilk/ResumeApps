//
//  ResumerViewController.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ResumeScrollerView.h"


@interface ResumerViewController : BaseViewController<ResumeScrollerViewDelegate>

{
    UIView*  _contentView1;
    UIView * _contentView2;
    UIView * _contentView3;
}

@end
