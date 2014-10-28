//
//  Resume.h
//  ResumeManage
//
//  Created by 单好坤 on 14-10-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"

@interface ResumeInfo : NSObject

-(id)initWithDic:(NSDictionary *)dic;

+(NSURLSessionDataTask *)saveResumeInfoParameters:(NSDictionary *)parameters WithBlock:(void (^)(ResumeInfo *resumeInfo, Error *e))block;

@end
