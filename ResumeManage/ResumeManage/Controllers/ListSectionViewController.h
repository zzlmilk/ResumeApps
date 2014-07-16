//
//  ListSectionViewController.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-10.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ListSectionViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;
    NSMutableArray *resumeAttributes;
    
}

@end
