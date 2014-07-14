//
//  ListSectionViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-10.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ListSectionViewController.h"
#import "HomeViewController.h"
#import "JobWishViewController.h"
#import "EducationViewController.h"

@interface ListSectionViewController ()

@property (strong, nonatomic)  UIImageView *expandZoomImageView;

@end

static CGFloat kImageOriginHight = 240.f;


@implementation ListSectionViewController

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
    
    
    
    tableView = ({
        UITableView *_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource=self;
        
        _tableView.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
        
        _expandZoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"testBg"]];
        _expandZoomImageView.frame = CGRectMake(0, 0, 320, kImageOriginHight);
        [_tableView addSubview:_expandZoomImageView];
        _tableView;
    });
    
    [self.view addSubview:tableView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.expandZoomImageView.frame = CGRectMake(0, -kImageOriginHight, tableView.frame.size.width, kImageOriginHight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if (yOffset < -kImageOriginHight) {
        CGRect f = self.expandZoomImageView.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset;
        self.expandZoomImageView.frame = f;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)ATableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
       static  NSString *cellId = @"ListSectionCellId";
    UITableViewCell *cell = [ATableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    switch (indexPath.row) {
        case 0:
            cell.textLabel.text  = @"个人信息";
            break;
        case 1:
            cell.textLabel.text  = @"求职意向";
            break;
        case 2:
            cell.textLabel.text  = @"教育背景";
            break;
            
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


#pragma mark --tableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            HomeViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
            
            [self presentViewController:homeVC animated:YES completion:^{
                
            }];
        }
            break;
        case 1:
        {
            JobWishViewController *jobWishVC = [self.storyboard instantiateViewControllerWithIdentifier:@"jobWishViewController"];
            
            [self presentViewController:jobWishVC animated:YES completion:^{
                
            }];
        }
            break;
        case 2:
        {
            EducationViewController *educationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"educationViewController"];
            
            [self presentViewController:educationVC animated:YES completion:^{
                
            }];
        }
            break;
            
        default:
            break;
    }


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
