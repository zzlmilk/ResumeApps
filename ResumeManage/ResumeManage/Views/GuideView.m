//
//  GuideView.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "GuideView.h"
#import "IntroModel.h"
#import "IntroControll.h"
#import "MNColorKit.h"
#import "ResumeColor.h"




@implementation GuideView




-(UIView *)guideTitleView:(CGRect)frame title:(NSString *)title{
    UIView *firstView = [[UIView alloc]init];
    firstView.frame = frame;
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:firstView.bounds];
//    background.image = [UIImage mn_imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    
    
    [firstView addSubview:background];
    

    
    
    UILabel *firstLabel = [[UILabel alloc]init];
    firstLabel.frame = firstView.bounds;
    firstLabel.text = title;
    firstLabel.textAlignment = NSTextAlignmentLeft;
    firstLabel.font = [UIFont boldSystemFontOfSize:20];
    firstLabel.numberOfLines = 0;
    [firstLabel sizeToFit];
    firstLabel.textColor = [ResumeColor randomRColor];

    [background addSubview:firstLabel];
    
        
    
    return firstView;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
  UIView * firstView = [self guideTitleView:CGRectMake(30, 90, 250, 50) title:@"我们可以失望，但不能盲目。"];

    IntroModel *model1 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image1" view:firstView];
        
    UIView * secondView = [self guideTitleView:CGRectMake(30, 90, 250, 50) title:@"流过泪的眼睛更明亮，滴过血的心灵更坚强！"];
        
    IntroModel *model2 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image2" view:secondView];
        
        
        
    UIView * threeView = [self guideTitleView:CGRectMake(30, 90, 250, 50) title:@"业精于勤，荒于嬉；行成于思，毁于随。"];
        
    IntroModel *model3 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image3" view:threeView];

        
        UIView * fourView = [self guideTitleView:CGRectMake(30, 90, 250, 50) title:@"自己选择的路，跪着也要把它走完。"];

        IntroModel *model4 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image4" view:fourView];


     IntroControll *introControll  =  [[IntroControll alloc] initWithFrame:self.bounds pages:@[model1, model2,model3,model4]];
    [self addSubview:introControll];
        
        
        
        UIButton *joinButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        joinButton.frame = CGRectMake(115,self.frame.size.height-90 , 90, 40);
        [joinButton setTitle:@"加入我们" forState:UIControlStateNormal];
        [joinButton setTitleColor:[ResumeColor r_green] forState:UIControlStateNormal];
        joinButton.titleLabel.font = [UIFont boldSystemFontOfSize: 16.0];
//        joinButton.backgroundColor = [UIColor colorWithRed:27/255.f green:161/255.f blue:218/255.f alpha:1.0f];
        joinButton.backgroundColor = [UIColor clearColor];
        [joinButton addTarget:self action:@selector(promptlyJoin) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:joinButton];

        
        
    }
    return self;
}

-(void)promptlyJoin{
    if ([self.delegate respondsToSelector:@selector(GuideDidFinish)])
    {
        [self.delegate GuideDidFinish];
    }
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
