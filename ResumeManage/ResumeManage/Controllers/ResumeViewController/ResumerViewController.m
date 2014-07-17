//
//  ResumerViewController.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumerViewController.h"
#import "Colours.h"

@interface ResumerViewController ()
{
    ResumeScrollerView *scrollerView;
}
@end

@implementation ResumerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
    
    
    
    scrollerView = [[ResumeScrollerView alloc]initWithFrame:self.view.bounds];
    scrollerView.resumeScrollerViewDelegate = self;
    //scrollerView.backgroundColor = [UIColor paleRoseColor];
    [self.view addSubview:scrollerView];
    
    [scrollerView reloadResumeScrollerView];
    
    [scrollerView openResumeScrollerViewCellAtIndex:0 animated:NO];
    
    
    
    
    
//    ResumeScrollerViewCell *cell = [scrollerView resumeScrollerViewCelForIndex:0];
//    NSLog(@"%d",cell.isClicked);
    
    
}

#pragma mark - ResumeScrollerView Click Delegate
-(int)numberOfCellsForResumeScrollerView{
    return 3;
}

-(NSString *)titleForResumeScrollerViewAtIndex:(int)index{
    switch (index) {
        case 0:
            return @"个人信息";
            break;
        case 1:
            return @"职业方向";
            break;
            
        case 2:
            return @"教育经历";
            break;
        default:
            return @"";
            break;
    }

}

-(UIView *)viewForResumeScrollerViewContentViewAtIndex:(int)index{
    
    _contentView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    _contentView1.backgroundColor = [UIColor pastelBlueColor];
    
    _contentView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    _contentView2.backgroundColor = [UIColor robinEggColor];
    
    _contentView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
    _contentView3.backgroundColor = [UIColor steelBlueColor];

    
    switch (index) {
        case 0:
            return _contentView1;
            break;
        case 1:
            return _contentView2;
            break;
        case 2:
            return _contentView3;
            break;
        default:
            return _contentView1;
            break;
    }

}





#pragma mark ---  Optional Methods
-(UIColor *)colorForResumeScrollerViewTitleViewAtIndex:(int)index{
    return [UIColor babyBlueColor];
}

-(UIColor *)colorForTitleLabelAtIndex:(int)index{
    return [UIColor charcoalColor];
}


-(void)didClickResumeScrollerViewCellAtIndex:(int)index isNowOpen:(BOOL)open{
    
    [scrollerView setContentSize:CGSizeMake(300, 30)];

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
