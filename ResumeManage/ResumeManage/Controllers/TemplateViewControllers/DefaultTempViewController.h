//
//  DefaultTempViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-26.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultTempViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic,strong)IBOutlet UIView *defultTempView;
@property(nonatomic,strong)IBOutlet UIScrollView *listTempScrollView;


- (IBAction)changeTemp;
@end
