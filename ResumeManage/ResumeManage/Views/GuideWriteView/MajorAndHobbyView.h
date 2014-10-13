//
//  MajorAndHobbyView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 1 计算机网络
 2 计算机应用
 3 软件技术
 4 电子商务
 5 工商企业管理
 6 UI设计
 7 土木工程
 8 建筑环境与能源应用工程
 9 给排水科学与工程
 10 建筑电气与智能化
 */

@interface MajorAndHobbyView : UIView<UIGestureRecognizerDelegate>
{
    UIButton *majorButton;
    UIButton *hobbyButton;
}

@property(nonatomic,strong)NSArray *majorArray;
@property(nonatomic,strong)NSArray *hobbyArray;

@property(nonatomic,strong)NSString *majorString;
@property(nonatomic,strong)NSString *hobbyString;

@end
