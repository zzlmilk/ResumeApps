//
//  HomeTableViewCell.h
//  ResumeManage
//
//  Created by 单好坤 on 14-9-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"

@interface HomeCell : UITableViewCell
{

}

@property(nonatomic,strong)IBOutlet UIImageView *userImageView;
@property(nonatomic,strong)IBOutlet UILabel *userNameLabel;
@property(nonatomic,strong)IBOutlet UILabel *sendTimeLabel;
@property(nonatomic,strong)IBOutlet UILabel *textContentLabel;

@property (nonatomic,strong)Home *home;

-(void)setIntroductionText:(NSString*)text;
@end
