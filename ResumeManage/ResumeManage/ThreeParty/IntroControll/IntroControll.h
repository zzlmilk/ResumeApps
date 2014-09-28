#import <UIKit/UIKit.h>
#import "IntroView.h"


@interface IntroControll : UIView<UIScrollViewDelegate> {
    UIImageView *backgroundImage1;
    UIImageView *backgroundImage2;
    

    UIPageControl *pageControl;
    NSArray *pages;
    
    NSTimer *timer;
    
    int currentPhotoNum;
}



@property(nonatomic,strong) UIScrollView *scrollView;;

- (id)initWithFrame:(CGRect)frame pages:(NSArray*)pages;


@end
