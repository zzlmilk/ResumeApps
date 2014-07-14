//
//  ListSectionViewController.m
//  ResumeManage
//
//  Created by 单好坤 on 14-7-10.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ListSectionViewController.h"
#import "Resume.h"


#import "HomeViewController.h"
#import "JobWishViewController.h"
#import "EducationViewController.h"
#import "ListTableViewCell.h"

@interface ListSectionViewController ()

@property (strong, nonatomic)  UIImageView *expandZoomImageView;

@end

static CGFloat kImageOriginHight = 240.f;


@implementation ListSectionViewController

-(Resume *)resumeData{
    Resume *r = [[Resume alloc]init];
    
    r.personal.name = @"周大仙";
    r.personal.birthday = @"2000年9月22日";
    r.personal.gender = male;
    r.personal.cellPhone = @"15901794453";
    r.personal.email = @"zzlmilk@gmail.com";
    
    
       
    return r;
}


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
    
    resumeAttributes = [NSMutableArray array];
    [resumeAttributes  addObject:@"0"];
    
    [resumeAttributes  addObject:@"1"];
    
    
    
    
    
   
    

    
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
    return resumeAttributes.count;
}

- (UITableViewCell *)tableView:(UITableView *)ATableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
       static  NSString *cellId = @"ListSectionCellId";
    ListTableViewCell *cell = [ATableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[ListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }


    

    
    NSString * att = [resumeAttributes objectAtIndex:indexPath.row];
    
    
     [cell setResume:[self resumeData] WithResumeAttribute:[att intValue]];
    
   // cell.textLabel.text  = @"填写xx内容";

    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  100;
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
