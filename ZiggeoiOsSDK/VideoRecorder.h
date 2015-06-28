#import <UIKit/UIKit.h>
#import "VCSimpleSession.h"

@protocol VideoRecorderDelegate <NSObject>
- (void) onUploadCompleteWithVideoToken:(NSString*)vt andImage:(UIImage*)img;
@end

@interface VideoRecorder : UIView {
NSString *VIDEO_TOKEN;
NSString *STREAM_TOKEN;
}

@property (weak, nonatomic) id<VideoRecorderDelegate> delegate;
@property (nonatomic, retain) VCSimpleSession* session;

@end