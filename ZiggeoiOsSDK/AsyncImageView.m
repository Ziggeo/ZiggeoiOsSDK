#import "AsyncImageView.h"

@implementation AsyncImageView

- (void)dealloc {
	[connection cancel];
}

- (void)loadImageFromURL:(NSURL*)url {
	NSURLRequest* request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
	if (data==nil) { data = [[NSMutableData alloc] initWithCapacity:2048]; }
	[data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	connection=nil;
	if ([[self subviews] count]>0)
		[[[self subviews] objectAtIndex:0] removeFromSuperview];
	UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:data]];
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth );
	[self addSubview:imageView];
	imageView.frame = self.bounds;
	[imageView setNeedsLayout];
	[self setNeedsLayout];
	data=nil;
}

- (UIImage*) image {
	UIImageView* iv = [[self subviews] objectAtIndex:0];
	return [iv image];
}

@end
