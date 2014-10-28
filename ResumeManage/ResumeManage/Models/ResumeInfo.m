//
//  Resume.m
//  ResumeManage
//
//  Created by 单好坤 on 14-10-14.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumeInfo.h"
#import "ApIClient.h"

@implementation ResumeInfo

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {

        
    }
    return self;
}


+(NSURLSessionDataTask *)saveResumeInfoParameters:(NSDictionary *)parameters WithBlock:(void (^)(ResumeInfo *resumeInfo, Error *e))block{

    return [[ApIClient shareClient]GET:@"resume_api/resume/save" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
     //   NSLog(@"%@",responseObject);
        
        if ([responseObject objectForKey:@"error"]) {
            Error *error = [[Error alloc]init];
            
            error.error =[[responseObject objectForKey:@"error"] objectForKey:@"error"];
            error.error_status =[[responseObject objectForKey:@"error"] objectForKey:@"error_status"];
            
            ResumeInfo *p;
            
            block(p,error);
            
        }else{
            

        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"网络异常");
        
    }];

}

@end
