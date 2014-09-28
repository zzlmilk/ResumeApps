//
//  Home.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"
#import "User.h"

@class User;
@interface Home : NSObject
{}

@property (nonatomic,strong)NSString *text;
@property (nonatomic,strong)NSString *source;
@property (nonatomic,strong)NSString *created_at;
@property (nonatomic,strong)User *user;


-(id)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask *)homeListInfoParameters:(NSDictionary *)parameters WithBlock:(void (^)(Home *home, Error *e))block;
@end
