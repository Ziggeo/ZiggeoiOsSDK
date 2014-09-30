//
//  VideoRecorder.h
//  ZiggeoiOsSDK
//
//  Created by Gianluca di Maggio on 29/09/14.
//  Copyright (c) 2014 Ziggeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VideoRecorderDelegate <NSObject>
- (void) onUploadCompleteWithVideoToken:(NSString*)vt andImage:(UIImage*)img;
@end

@interface VideoRecorder : UIView {
NSString *VIDEO_TOKEN;
NSString *STREAM_TOKEN;
}

@end