//
//  UniversityViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-8.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//


#import "LeadPageViewController.h"
#import "CPKenburnsView.h"
#import "SchoolMajorViewController.h"
#import "MNColorKit.h"




@interface LeadPageViewController ()

@end


@implementation LeadPageViewController

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
    GuideView *guideView = [[GuideView alloc]initWithFrame:self.view.bounds];
    guideView.delegate = self;
    guideView.backgroundColor = [UIColor brownColor];
    guideView.alpha = 0.8f;
    [self.view addSubview:guideView];
    
    
}


#pragma mark GuideViewDelegate 
-(void)GuideDidFinish{
    SchoolMajorViewController *schoolMajorVC = [self.storyboard instantiateViewControllerWithIdentifier:@"schoolMajorViewController"];
    
    [self presentViewController:schoolMajorVC animated:YES completion:^{
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
