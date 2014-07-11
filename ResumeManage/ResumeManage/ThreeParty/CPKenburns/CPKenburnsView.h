    //
    //  CPKenburnsImageView.h
    //
    //The MIT License (MIT)
    //Copyright © 2014 Muukii (www.muukii.me)
    //
    //Permission is hereby granted, free of charge, to any person obtaining a copy
    //of this software and associated documentation files (the “Software”), to deal
    //in the Software without restriction, including without limitation the rights
    //to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    //copies of the Software, and to permit persons to whom the Software is
    //furnished to do so, subject to the following conditions:
    //
    //The above copyright notice and this permission notice shall be included in
    //all copies or substantial portions of the Software.
    //
    //THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    //IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    //FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    //AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    //LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    //OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    //THE SOFTWARE.

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CPKenburnsImageViewState) {
    CPKenburnsImageViewStateAnimating,
    CPKenburnsImageViewStatePausing
};

typedef NS_ENUM(NSInteger, CPKenburnsImageViewZoomCourse) {
    CPKenburnsImageViewZoomCourseRandom                = 0,
    CPKenburnsImageViewZoomCourseUpperLeftToLowerRight = 1,
    CPKenburnsImageViewZoomCourseUpperRightToLowerLeft = 2,
    CPKenburnsImageViewZoomCourseLowerLeftToUpperRight = 3,
    CPKenburnsImageViewZoomCourseLowerRightToUpperLeft = 4
};
typedef NS_ENUM(NSInteger, CPKenburnsImageViewZoomPoint) {
    CPKenburnsImageViewZoomPointLowerLeft  = 0,
    CPKenburnsImageViewZoomPointLowerRight = 1,
    CPKenburnsImageViewZoomPointUpperLeft  = 2,
    CPKenburnsImageViewZoomPointUpperRight = 3
};

@interface CPKenburnsImageView : UIImageView

@end

@interface CPKenburnsView : UIView
@property (nonatomic, strong) CPKenburnsImageView * imageView;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, assign) CGFloat animationDuration;  //default is 13.f
@property (nonatomic, assign) CGFloat zoomRatio; // default 0.1  0 ~ 1 not working
@property (nonatomic, assign) CGFloat endZoomRate; // default 1.2
@property (nonatomic, assign) CGFloat startZoomRate; // default 1.3
@property (nonatomic, assign) UIEdgeInsets padding; // default UIEdgeInsetsMake(10, 10, 10, 10);
@property (nonatomic, assign) CPKenburnsImageViewZoomCourse course; // default is 0

@property (nonatomic, assign) CPKenburnsImageViewState state;

- (void)restartMotion;
- (void)showWholeImage;
- (void)zoomAndRestartAnimation;
- (void)zoomAndRestartAnimationWithCompletion:(void(^)(BOOL finished))completion;
@end
