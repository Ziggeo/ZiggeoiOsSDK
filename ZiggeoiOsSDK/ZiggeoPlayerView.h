//
//  ZiggeoVideoPlayer.h
//  ZiggeoiOsSDK
//
//  Created by Oliver Friedmann on 24/04/14.
//  Copyright (c) 2014 Ziggeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZiggeoPlayerView : UIView

-(void)attach:(NSString*)video_token;
-(void)play;

@end
