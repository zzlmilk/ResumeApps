//
//  ResumerViewController.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-15.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumerViewController.h"
#import "Colours.h"
#import "PersonInfoView.h"
#import "SpecialtyView.h"
#import "IWishView.h"

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
    
    [scrollerView openResumeScrollerViewCellAtIndex:2 animated:NO];
    
    
    
    
    
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
            return @"我的信息";
            break;
        case 1:
            return @"我的特长";
            break;
            
        case 2:
            return @"我的态度";
            break;
        default:
            return @"";
            break;
    }

}

-(UIView *)viewForResumeScrollerViewContentViewAtIndex:(int)index{
    
    _contentView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 450)];
    _contentView1.backgroundColor = [UIColor snowColor];
    PersonInfoView *personInfoView = [[PersonInfoView alloc]init];
    [_contentView1 addSubview:personInfoView];
    
    _contentView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 170)];
    _contentView2.backgroundColor = [UIColor snowColor];
    SpecialtyView *specialtyView = [[SpecialtyView alloc]init];
    [_contentView2 addSubview:specialtyView];
    
    _contentView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 230)];
    _contentView3.backgroundColor = [UIColor snowColor];
    IWishView *iWishView = [[IWishView alloc]init];
    [_contentView3 addSubview:iWishView];

    
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
