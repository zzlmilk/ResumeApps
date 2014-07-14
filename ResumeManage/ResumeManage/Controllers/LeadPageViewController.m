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
    
    UIView *firstView = [[UIView alloc]init];
    firstView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //firstView.backgroundColor = [UIColor colorWithRed:10/255.f green:10/255.f blue:10/255.f alpha:0.2f];
    
    UILabel *firstLabel = [[UILabel alloc]init];
    firstLabel.frame = CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-80, 200, 45);
    firstLabel.backgroundColor = [UIColor clearColor];
    firstLabel.text = @"新的起点从这里开始";
    firstLabel.textAlignment = NSTextAlignmentCenter;
    firstLabel.textColor = [UIColor whiteColor];
    [firstView addSubview:firstLabel];
    
    
//    CPKenburnsView *kenburnsView1 = [[CPKenburnsView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
//    kenburnsView1.image = [UIImage imageNamed:@"image1"];
//    kenburnsView1.backgroundColor = [UIColor clearColor];
//    [firstView addSubview:kenburnsView1];
    
    IntroModel *model1 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image1" view:firstView];
    
    
    UIView *secondView = [[UIView alloc]init];
    secondView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //secondView.backgroundColor = [UIColor colorWithRed:10/255.f green:10/255.f blue:10/255.f alpha:0.2f];
    
    UILabel *secondLabel = [[UILabel alloc]init];
    secondLabel.frame = CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-80, 200, 45);
    secondLabel.backgroundColor = [UIColor clearColor];
    secondLabel.text = @"Example 2";
    secondLabel.textAlignment = NSTextAlignmentCenter;
    secondLabel.textColor = [UIColor whiteColor];
    [secondView addSubview:secondLabel];
    
    IntroModel *model2 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image2" view:secondView];

    

    UIView *threeView = [[UIView alloc]init];
    threeView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //threeView.backgroundColor = [UIColor colorWithRed:10/255.f green:10/255.f blue:10/255.f alpha:0.2f];
    
    UILabel *threeLabel = [[UILabel alloc]init];
    threeLabel.frame = CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-80, 200, 45);
    threeLabel.backgroundColor = [UIColor clearColor];
    threeLabel.text = @"Example 3";
    threeLabel.textAlignment = NSTextAlignmentCenter;
    threeLabel.textColor = [UIColor whiteColor];
    [threeView addSubview:threeLabel];
    
    IntroModel *model3 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image3" view:threeView];
    
    UIView *fourView = [[UIView alloc]init];
    fourView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //fourView.backgroundColor = [UIColor colorWithRed:10/255.f green:10/255.f blue:10/255.f alpha:0.2f];
    
    UILabel *fourLabel = [[UILabel alloc]init];
    fourLabel.frame = CGRectMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2-80, 200, 45);
    fourLabel.backgroundColor = [UIColor clearColor];
    fourLabel.text = @"Example 4";
    fourLabel.textAlignment = NSTextAlignmentCenter;
    fourLabel.textColor = [UIColor whiteColor];
    [fourView addSubview:fourLabel];
    
    
    IntroModel *model4 = [[IntroModel alloc] initWithTitle:nil description:nil image:@"image4" view:fourView];

    
    self.view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pages:@[model1, model2, model3,model4]];
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton *joinButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    joinButton.frame = CGRectMake(115,self.view.frame.size.height-90 , 90, 40);
    [joinButton setTitle:@"立即加入" forState:UIControlStateNormal];
    [joinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    joinButton.titleLabel.font = [UIFont boldSystemFontOfSize: 16.0];
    joinButton.backgroundColor = [UIColor colorWithRed:27/255.f green:161/255.f blue:218/255.f alpha:1.0f];
    joinButton.titleLabel.textColor = [UIColor whiteColor];
    [joinButton addTarget:self action:@selector(promptlyJoin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:joinButton];
    
}


-(void)promptlyJoin{

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
