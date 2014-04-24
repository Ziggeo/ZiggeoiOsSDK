//
//  ZiggeoiOsSDK.h
//  ZiggeoiOsSDK
//
//  Created by Oliver Friedmann on 23/04/14.
//  Copyright (c) 2014 Ziggeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZiggeoiOsSDK : NSObject

+ (void)init:(NSString*)app_token;

+ (NSURL*)getVideoPath:(NSString*)video_token;
+ (NSURL*)getImagePath:(NSString*)video_token;

@end
