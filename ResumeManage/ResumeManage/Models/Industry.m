//
//  Industry.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-29.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Industry.h"
#import "ApIClient.h"

@implementation Industry

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
     
        _genderString = [dic objectForKey:@"sex"];
        _heightIndustryArray = [dic objectForKey:@"industry"];
        
    }
    return self;
    
}

+(NSURLSessionDataTask *)getGenderAndIndustryParameters:(NSDictionary *)parameters WithBlock:(void (^)(Industry *, Error *))block{
    
    return [[ApIClient shareClient]GET:@"resume_api/resume/get_data" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if ([responseObject objectForKey:@"error"]) {
            Error *error = [[Error alloc]init];
            
            error.error =[[responseObject objectForKey:@"error"] objectForKey:@"error"];
            error.error_status =[[responseObject objectForKey:@"error"] objectForKey:@"error_status"];
            
            Industry *p;
            
            block(p,error);
            
        }else{
            
            Industry *b = [[Industry alloc]initWithDic:responseObject];
            
            block(b,nil);
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"网络异常");
        
    }];

}

@end
