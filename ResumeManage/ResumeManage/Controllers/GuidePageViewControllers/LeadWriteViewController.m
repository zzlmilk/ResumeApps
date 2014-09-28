//
//  LeadWriteViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-28.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "LeadWriteViewController.h"
#import "CPKenburnsView.h"
#import "MNColorKit.h"
#import "RootViewController.h"
@interface LeadWriteViewController ()

@end


@implementation LeadWriteViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    return self;
}

- (void) loadView {
    [super loadView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //guideView
    GuideWriteView *guideWriteView = [[GuideWriteView alloc]initWithFrame:self.view.bounds With:self];

    guideWriteView.backgroundColor = [UIColor brownColor];
    guideWriteView.alpha = 0.8f;
    [self.view addSubview:guideWriteView];
    
}

#pragma mark TagAndPayDelegate
-(void)TagAndPaySkipFinish{
    
    RootViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rootViewController"];
    
    [self presentViewController:homeVC animated:YES completion:^{
        
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
