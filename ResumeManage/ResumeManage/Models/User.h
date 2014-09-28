//
//  User.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApIClient.h"
#import "Home.h"

@interface User : NSObject

@property (nonatomic) int userId;
@property (nonatomic,strong)NSString *screenName;
@property (nonatomic,strong)NSString *imageUrl;
@property (nonatomic,strong)NSString *description;
@property (nonatomic,strong)NSString *gender;
//@property (nonatomic,strong)Home *home;

-(id)initWithDic:(NSDictionary *)dic;



@end
