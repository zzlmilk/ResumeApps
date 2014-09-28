//
//  TagAndPayView.h
//  ResumeManage
//
//  Created by 单好坤 on 14-7-31.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideWriteView.h"

@protocol TagAndPayDelegate <NSObject>

-(void)TagAndPaySkipFinish;

@end


@interface TagAndPayView : UIView
{
    UIButton *tagButton;
    UIButton *payButton;
}

@property(nonatomic,strong)NSArray *tagArray;
@property(nonatomic,strong)NSArray *payArray;
@property(nonatomic,assign) id<TagAndPayDelegate>delegate;

- (void)skipList;


@end
