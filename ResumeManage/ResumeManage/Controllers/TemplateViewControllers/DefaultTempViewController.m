//
//  DefaultTempViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-9-26.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "DefaultTempViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <AGCommon/UIDevice+Common.h>

@interface DefaultTempViewController ()

@end

@implementation DefaultTempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(buttonClicked:)];
    self.navigationItem.rightBarButtonItem = shareItem;
    
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFromDown:)];
    [self.view addGestureRecognizer:panGes];
    
    _defultTempView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"defaultTemp"]];
    
    _listTempScrollView.backgroundColor = RGBACOLOR(0, 0, 0, 0.8);

    _listTempScrollView.delegate = self;
    _listTempScrollView.hidden = YES;
    
}

//选择模版后 隐藏模版选项(scrollVew)
- (IBAction)changeTemp{
    
    CATransition *animation = [CATransition animation];
    
    animation.type = kCATransitionFade;
    animation.duration = 0.4;
    [_listTempScrollView.layer addAnimation:animation forKey:nil];
    
    _listTempScrollView.hidden = YES;
}

//view 中 手势向下 显示 模版选项(scrollVew)
-(void)handleSwipeFromDown:(id)sender{
    
    UIPanGestureRecognizer *recognizer = (UIPanGestureRecognizer *)sender;
    
    CGPoint translatedPoint = [recognizer translationInView:self.view];
    
    if (translatedPoint.y > 0 && translatedPoint.x == 0){
    
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFade;
        animation.duration = 0.4;
        [_listTempScrollView.layer addAnimation:animation forKey:nil];
        
        [_listTempScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+30)];
        _listTempScrollView.hidden = NO;
    
    }

}

- (void)buttonClicked:(id)sender
{
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"测试信息"
                                                  url:@"http://www.baidu.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_SHARE_FAI", @"发布失败!error code == %d, error code == %@"), [error errorCode], [error errorDescription]);
                                }
                            }];
    
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
