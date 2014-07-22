//
//  FirstPanel.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYCustomPanel.h"


@interface FirstPanel : MYIntroductionPanel


@property(nonatomic,weak)IBOutlet UIButton *button;


-(IBAction)buttonPress:(id)sender;

@end
