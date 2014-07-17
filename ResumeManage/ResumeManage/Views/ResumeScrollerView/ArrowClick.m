//
//  ArrowClick.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-17.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ArrowClick.h"

@implementation ArrowClick

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.arrowColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


-(void)drawWithColor:(UIColor *)color{
    self.arrowColor  =color;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    UIBezierPath *arraw = [UIBezierPath bezierPath];
    [self.arrowColor setFill];
    [arraw moveToPoint:CGPointMake(rect.size.width , rect.size.height/2)];
    [arraw addLineToPoint:CGPointMake(0, rect.size.height)];
    [arraw addLineToPoint:CGPointMake(0, 0)];
    [arraw addLineToPoint:CGPointMake(rect.size.width, rect.size.height/2)];
    [arraw fill];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
