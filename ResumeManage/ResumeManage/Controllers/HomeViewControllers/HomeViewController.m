//
//  DEMOHomeViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "HomeViewController.h"
#import "NavigationController.h"
#import "HomeCell.h"
#import "Home.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Balloon"]];
    
    _hometableView.delegate = self;
    _hometableView.dataSource = self;
    
    [self getWeiBoStatus];
    
}

//先获取微博部分数据
-(void)getWeiBoStatus{
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:@"2.00CRgIDC7EG4JE58ef8087bdlMIUVD" forKey:@"access_token"];
    [dic setObject:@"21" forKey:@"count"];
    
    [Home homeListInfoParameters:dic WithBlock:^(Home *home, Error *e) {
       
        _ListInfoArray = home;
        [_hometableView reloadData];
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _ListInfoArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"myCellId";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
    if (cell == nil) {
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    Home *s = [_ListInfoArray objectAtIndex:indexPath.row];
    
    cell.home = s;
    
    [cell setIntroductionText:s.text];
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:_hometableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}

- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

@end
