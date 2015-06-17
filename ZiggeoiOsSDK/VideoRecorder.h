#import <UIKit/UIKit.h>

@protocol VideoRecorderDelegate <NSObject>
- (void) onUploadCompleteWithVideoToken:(NSString*)vt andImage:(UIImage*)img;
@end

@interface VideoRecorder : UIView {
NSString *VIDEO_TOKEN;
NSString *STREAM_TOKEN;
}

@end