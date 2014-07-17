//
//  ResumeScrollerView.h
//  ResumeManage
//
//  Created by zzlmilk on 14-7-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResumeScrollerViewCell.h"


@protocol ResumeScrollerViewDelegate <NSObject>
@required
-(int)numberOfCellsForResumeScrollerView;
-(NSString *)titleForResumeScrollerViewAtIndex:(int)index;
-(UIView *)viewForResumeScrollerViewContentViewAtIndex:(int)index;

@optional
-(UIColor *)colorForResumeScrollerViewTitleViewAtIndex:(int)index;
-(UIColor *)colorForTitleLabelAtIndex:(int)index;
-(UIColor *)colorForTitleArrowAtIndex:(int)index;
-(void)didClickResumeScrollerViewCellAtIndex:(int)index isNowOpen:(BOOL)open;

@end

#define kCCPad 10


@interface ResumeScrollerView : UIScrollView
{
    
}
// Delegate
@property (weak) id <ResumeScrollerViewDelegate> resumeScrollerViewDelegate;

// Properties
@property (nonatomic, strong) NSMutableArray *isClickedArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

// Methods
-(void)reloadResumeScrollerView;
-(ResumeScrollerViewCell *)resumeScrollerViewCelForIndex:(int)index;
-(void)scrollToResumeScrollerViewCellAtIndex:(int)index animated:(BOOL)animated;

-(UIView *)contentViewForCellAtIndex:(int)index;

-(void)openResumeScrollerViewCellAtIndex:(int)index animated:(BOOL)animated;

-(void)closeResumeScrollerViewCellAtIndex:(int)index animated:(BOOL)animated;



@end
