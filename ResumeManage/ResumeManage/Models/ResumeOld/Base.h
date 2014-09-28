//
//  Base.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base : NSObject

@property(nonatomic,strong) NSString *title;
@property (nonatomic,strong)NSString *description;

@property(nonatomic,strong) NSString *number;
@property(nonatomic,strong) UIColor *color;
@property                   BOOL  isComplete;


@end
