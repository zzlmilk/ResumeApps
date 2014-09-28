//
//  DEMOHomeViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) IBOutlet UITableView *hometableView;

@property NSArray *ListInfoArray;

- (IBAction)showMenu;


@end
