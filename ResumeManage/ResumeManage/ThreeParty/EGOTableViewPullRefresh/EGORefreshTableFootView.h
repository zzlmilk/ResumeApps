//
//  EGORefreshTableFootView.h
//  Demo
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//
//修改人：李浩 iphone开发qq群：419590779 邮箱：ss_lihao@163.com
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	EGOOPullRefreshPulling1 = 0,
	EGOOPullRefreshNormal1,
	EGOOPullRefreshLoading1,	
} EGOPullRefreshState1;

@protocol EGORefreshTableFootDelegate;
@interface EGORefreshTableFootView : UIView {
	
	id _delegate;
	EGOPullRefreshState1 _state;

	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
}

@property(nonatomic,assign) id <EGORefreshTableFootDelegate> delegate;

- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;
@end
@protocol EGORefreshTableFootDelegate
- (void)egoRefreshTableFootDidTriggerRefresh:(EGORefreshTableFootView*)view;
- (BOOL)egoRefreshTableFootDataSourceIsLoading:(EGORefreshTableFootView*)view;
@optional
- (NSDate*)egoRefreshTableFootDataSourceLastUpdated:(EGORefreshTableFootView*)view;
@end
