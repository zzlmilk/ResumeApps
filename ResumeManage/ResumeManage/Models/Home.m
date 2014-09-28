//
//  Home.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "Home.h"
#import "ApIClient.h"
#import "Error.h"

@implementation Home

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {

        _text = [dic objectForKey:@"text"];
        _source = [dic objectForKey:@"source"];
        _created_at = [dic objectForKey:@"created_at"];
        NSDictionary *userDic = [dic objectForKey:@"user"];
        
        if (userDic) {
            _user = [[User alloc]initWithDic:userDic];
        }
    }
    return self;
    
}


+(NSURLSessionDataTask *)homeListInfoParameters:(NSDictionary *)parameters WithBlock:(void (^)(Home *home, Error *e))block{
    
    return [[ApIClient shareClient]GET:@"/2/statuses/public_timeline.json" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([responseObject objectForKey:@"error"]) {
            Error *error = [[Error alloc]init];
            
            error.error =[[responseObject objectForKey:@"error"] objectForKey:@"error"];
            error.error_status =[[responseObject objectForKey:@"error"] objectForKey:@"error_status"];
            
            Home *p;
            block(p,error);
            
        }else{
        
            NSMutableArray *statusArray  =   [responseObject objectForKey:@"statuses"];
            
            NSMutableArray *statusList = [NSMutableArray array];
            
            for (int i=0; i<statusArray.count; i++) {
                NSDictionary *statusDic = [statusArray objectAtIndex:i];
                Home * s = [[Home alloc]initWithDic:statusDic];
                [statusList addObject:s];
            }
            
            NSLog(@"%@",statusList);
            block(statusList,nil);
            
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"网络异常");
        
    }];

}

@end
