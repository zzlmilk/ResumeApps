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
    NSArray *colors = @[[ResumeColor r_green],[ResumeColor r_violet],[ResumeColor r_black],[ResumeColor r_red],[ResumeColor r_tangerine],
        [ResumeColor r_Blue],[ResumeColor r_Teal],[ResumeColor r_light],
        [ResumeColor r_Sage]];
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

+(UIColor *)r_violet{
    return [UIColor colorWithRed:80/255.f green:51/255.0 blue:175/255.f alpha:1.f];
}


+(UIColor *)r_black{
    return [UIColor colorWithRed:27/255.f green:175/255.f blue:32/255.f alpha:1.f];
    
}

+(UIColor *)r_red{
    return [UIColor colorWithRed:252/255.f green:69/255.f blue:72/255.f alpha:1.f];
    
}

+(UIColor *)r_tangerine{
    return [UIColor colorWithRed:252/255.f green:91/255.f blue:32/255.f alpha:1.f];
    
}

+(UIColor *)r_Blue{
    return [UIColor colorWithRed:82/255.f green:171/255.f blue:251/255.f alpha:1.f];
    
}

+(UIColor *)r_Teal{
    return [UIColor colorWithRed:29/255.f green:163/255.f blue:251/255.f alpha:1.f];
    
}

+(UIColor *)r_light{
    return [UIColor colorWithRed:60/255.f green:192/255.f blue:205/255.f alpha:1.f];
    
}

+(UIColor *)r_Sage{
    return [UIColor colorWithRed:158/255.f green:198/255.f blue:39/255.f alpha:1.f];
    
}





@end
