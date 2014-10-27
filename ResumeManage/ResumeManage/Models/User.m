//
//  User.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _userId = [[dic objectForKey:@"id"] intValue];
        _screenName = [dic objectForKey:@"screen_name"];
        _imageUrl  = [dic objectForKey:@"profile_image_url"];
//        _description = [dic objectForKey:@"description"];
        _gender = [dic objectForKey:@"gender"];
        
//        NSDictionary *statusDic = [dic objectForKey:@"status"];
//        Home * s= [[Home alloc]initWithDic:statusDic];
//        _home = s;
    }
    return self;
}

@end
