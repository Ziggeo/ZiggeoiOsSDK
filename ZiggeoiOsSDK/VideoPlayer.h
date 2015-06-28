
#import <UIKit/UIKit.h>

@interface VideoPlayer : UIView

-(void)setVideoToken:(NSString*)video_token;
//Allows you to set the view controller to play on. Allows flexibility in view hierarchy.
@property (nonatomic, strong) UIViewController *vc;


@end