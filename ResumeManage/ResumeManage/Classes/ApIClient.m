//
//  ApIClient.m
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "ApIClient.h"

//static NSString *const AppBaseUrl = @"https://api.weibo.com";
static NSString *const AppBaseUrl = @"http://192.168.0.106";

@implementation ApIClient

//单例
+(id)shareClient{
    static ApIClient *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _shareClient = [[ApIClient alloc]initWithBaseURL:[NSURL URLWithString:AppBaseUrl]];
        [_shareClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone]];
    });
    
    
    
    

    return _shareClient;
    
}

@end
