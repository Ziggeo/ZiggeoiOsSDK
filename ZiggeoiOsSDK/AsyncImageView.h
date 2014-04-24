#import <UIKit/UIKit.h>

@interface AsyncImageView : UIView {
	NSURLConnection* connection;
	NSMutableData* data;
}

- (void)loadImageFromURL:(NSURL*)url;
- (UIImage*) image;

@end