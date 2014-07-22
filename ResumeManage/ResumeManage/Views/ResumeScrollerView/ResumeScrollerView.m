//
//  ResumeScrollerView.m
//  ResumeManage
//
//  Created by zzlmilk on 14-7-16.
//  Copyright (c) 2014年 单好坤. All rights reserved.
//

#import "ResumeScrollerView.h"
#import "Colours.h"


@implementation ResumeScrollerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.isClickedArray = [[NSMutableArray alloc]initWithCapacity:[_resumeScrollerViewDelegate numberOfCellsForResumeScrollerView]];
        self.dataArray = [NSMutableArray array];
        [self reloadResumeScrollerView];
        self.clipsToBounds =YES;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

}


#pragma mark  -load data
-(void)reloadResumeScrollerView{
    
    float totalHeight = 0;
    
    if (!self.isClickedArray) {
         self.isClickedArray = [[NSMutableArray alloc]initWithCapacity:[_resumeScrollerViewDelegate numberOfCellsForResumeScrollerView]];
    }
    if (!self.dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    
    
    //remove and clear view
    [self.isClickedArray removeAllObjects];
    [self.dataArray removeAllObjects];
    
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    

    for (int i = 0; i< [_resumeScrollerViewDelegate numberOfCellsForResumeScrollerView]; i++) {
        ResumeScrollerViewCell *cell = [ResumeScrollerViewCell newResumeScrollerViewCellWithTitle:[_resumeScrollerViewDelegate titleForResumeScrollerViewAtIndex:i] index:i content:[_resumeScrollerViewDelegate viewForResumeScrollerViewContentViewAtIndex:i]];
        
         // Set cell.ContentView's size
        cell.contentView.frame = CGRectMake(0,kCCHeaderHeight, self.frame.size.width, cell.contentView.frame.size.height);
        
        //set cell size
        cell.frame = CGRectMake(0, totalHeight, self.frame.size.width, kCCHeaderHeight);
        
        
        // Add target to Button
        [cell.titleButton addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //titleView color
        if ([_resumeScrollerViewDelegate respondsToSelector:@selector(colorForResumeScrollerViewTitleViewAtIndex:)]) {
            cell.titleView.backgroundColor = [_resumeScrollerViewDelegate colorForResumeScrollerViewTitleViewAtIndex:i];
        }
        else {
            cell.titleView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:1.0];
        }
        
        
        // Set cell.TitleLabel's Color
        if ([(id)_resumeScrollerViewDelegate respondsToSelector:@selector(colorForTitleLabelAtIndex:)]) {
            cell.titleLabel.textColor = [_resumeScrollerViewDelegate colorForTitleLabelAtIndex:i];
        }
        else {
            cell.titleLabel.textColor = [UIColor blackColor];
        }


        
        [self addSubview:cell];
        [self.isClickedArray addObject:[NSNumber numberWithBool:NO]];
        [self.dataArray addObject:cell];
        
        totalHeight  += kCCHeaderHeight +kCCPad ;
        
    }
    

    [self setContentSize:CGSizeMake(self.frame.size.width, totalHeight)];
    [self setContentOffset:CGPointZero];
     
    
}


#pragma mark - Did Click

-(void)didSelectButton :(UIButton *)titleButton{
    BOOL isOpen = NO;
    int indexTag =(int)titleButton.tag;
    
    if ([[self.isClickedArray objectAtIndex:titleButton.tag] boolValue] ==YES) {
        [self closeResumeScrollerViewCellAtIndex:indexTag animated:YES];
    }
    else{
        [self openResumeScrollerViewCellAtIndex:indexTag animated:YES];
        isOpen = YES;
    }
    
    if ([_resumeScrollerViewDelegate respondsToSelector:@selector(didClickResumeScrollerViewCellAtIndex:isNowOpen:)]) {
        [_resumeScrollerViewDelegate didClickResumeScrollerViewCellAtIndex:indexTag isNowOpen:isOpen];
    }
    

}

#pragma mark - Open 
-(void)openResumeScrollerViewCellAtIndex:(int)index animated:(BOOL)animated{
    if ([[self.isClickedArray objectAtIndex:index] boolValue] !=YES) {
        float duration = 0;
        if (animated) {
            duration = 0.25;
        }
        
        [UIView animateWithDuration:duration animations:^{
            ResumeScrollerViewCell *cell = [self.dataArray objectAtIndex:index];
            cell.frame =  CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.contentView.frame.origin.y+cell.contentView.frame.size.height+kCCPad);
            
            // Change Arrow orientation
            CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/2);
            cell.arrowClick.transform = transform;
            

            
            
            [self.isClickedArray replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:YES]];
            
            [self repositionCollapseClickCellsBelowIndex:index withOffset:cell.contentView.frame.size.height + kCCPad] ;
        }];
    }
}

#pragma mark - Close 
-(void)closeResumeScrollerViewCellAtIndex:(int)index animated:(BOOL)animated{
    
    
    if ([[self.isClickedArray objectAtIndex:index] boolValue]  == YES) {
        float duration = 0 ;
        if (animated) {
            duration =0.25f;
        }
        
        
        
        [UIView animateWithDuration:duration animations:^{
            ResumeScrollerViewCell *cell = [self.dataArray objectAtIndex:index];
            
            cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, kCCHeaderHeight);
            
            // Change Arrow orientation
            CGAffineTransform transform = CGAffineTransformMakeRotation(0);
            cell.arrowClick.transform = transform;
            
            [self.isClickedArray replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:NO]];
            
            [self repositionCollapseClickCellsBelowIndex:index withOffset:-1*(cell.contentView.frame.size.height +kCCPad) ];
        }];
    }
}



#pragma mark - Reposition Cells
-(void)repositionCollapseClickCellsBelowIndex:(int)index withOffset:(float)offset {
    
    for (int i = index+1; i <self.dataArray.count; i++) {
        ResumeScrollerViewCell *cell = [self.dataArray objectAtIndex:i];
        cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y+offset, cell.frame.size.width, cell.frame.size.height);
        
    }
    
    // Resize self.ContentSize
    ResumeScrollerViewCell *lastCell = [self.dataArray objectAtIndex:self.dataArray.count -1];
    [self setContentSize:CGSizeMake(self.frame.size.width, lastCell.frame.origin.y+lastCell.frame.size.height)];
    
}


#pragma mark - CollapseClickCell for Index
-(ResumeScrollerViewCell *)resumeScrollerViewCelForIndex:(int)index {
    if ([[self.dataArray objectAtIndex:index] isKindOfClass:[ResumeScrollerViewCell class]]) {
        return [self.dataArray objectAtIndex:index];
    }
    
    return nil;
}

#pragma mark - Content View for Cell
-(UIView *)contentViewForCellAtIndex:(int)index {
    ResumeScrollerViewCell *cell = [self.subviews objectAtIndex:index];
    return cell.contentView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
