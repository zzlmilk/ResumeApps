//
//  Industry.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"

@interface Industry : NSObject

@property(nonatomic, strong)NSString *genderString;
@property(nonatomic, strong)NSArray *heightIndustryArray;


-(id)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask *)getGenderAndIndustryParameters:(NSDictionary *)parameters WithBlock:(void (^)(Industry *industry, Error *e))block;

@end
