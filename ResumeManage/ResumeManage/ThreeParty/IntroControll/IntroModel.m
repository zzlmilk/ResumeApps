
#import "IntroModel.h"

@implementation IntroModel

@synthesize titleText;
@synthesize descriptionText;
@synthesize image;
@synthesize view;

- (id) initWithTitle:(NSString*)title description:(NSString*)desc image:(NSString*)imageText view:(UIView *)introView{
    self = [super init];
    if(self != nil) {
        
        titleText = title;
        descriptionText = desc;
        image = [UIImage imageNamed:imageText];
//        image = [UIImage mn_imageWithColor:[UIColor yellowColor]];
        view = introView;
        
    }
    return self;
}

@end
