//
//  ApIClient.h
//  Weibo_pro
//
//  Created by zzlmilk on 14-3-23.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"

@interface ApIClient : AFHTTPSessionManager

+(id)shareClient;

@end
