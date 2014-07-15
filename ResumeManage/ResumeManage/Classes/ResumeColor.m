//
//  ResumeColor.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumeColor.h"

@implementation ResumeColor

+(NSArray *)resumeColors{
    NSArray *colors = @[[ResumeColor r_green],[ResumeColor r_blue],[ResumeColor r_black]];
    return colors;
}

+(UIColor *)randomRColor{
    //颜色数量 3
    int colorNumber = 3;
    
    // 获取0到x-1之间的整数的代码如下：
    int random =(arc4random() % colorNumber);
   
   UIColor * r_color = [[ResumeColor resumeColors] objectAtIndex:random];
    
    
    
    return r_color;
    
}

+(UIColor *)r_green{
       return  [UIColor colorWithRed:237/255.f green:180/255.0 blue:44/255.f alpha:1.f];
}

+(UIColor *)r_blue{
    return [UIColor colorWithRed:80/255.f green:51/255.0 blue:175/255.f alpha:1.f];
}


+(UIColor *)r_black{
    return [UIColor colorWithRed:27/255.f green:175/255.f blue:32/255.f alpha:1.f];
    
}





@end
