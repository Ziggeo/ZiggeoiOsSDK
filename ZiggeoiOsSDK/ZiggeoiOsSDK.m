//
//  ZiggeoiOsSDK.m
//  ZiggeoiOsSDK
//
//  Created by Oliver Friedmann on 23/04/14.
//  Copyright (c) 2014 Ziggeo. All rights reserved.
//

#import "ZiggeoiOsSDK.h"

@implementation ZiggeoiOsSDK

static NSString* embedServerUri = @"embed.ziggeo.com";
static NSString* wowzaServerUri = @"wowzaapi.ziggeo.com";

static NSString* token = @"";

+ (void)init:(NSString*)app_token
{
    token = app_token;
}

+ (NSURL*)getVideoPath:(NSString*)video_token
{
    NSMutableString* url = [[NSMutableString alloc] init];
    [url appendString:@"https://"];
    [url appendString:wowzaServerUri];
    [url appendString:@"/vod/_definst_/applications/"];
    [url appendString:token];
    [url appendString:@"/videos/"];
    [url appendString:video_token];
    [url appendString:@"/video.mp4/playlist.m3u8"];
    return [NSURL URLWithString:url];
}

+ (NSURL*)getImagePath:(NSString*)video_token;
{
    NSMutableString* url = [[NSMutableString alloc] init];
    [url appendString:@"https://"];
    [url appendString:embedServerUri];
    [url appendString:@"/v1/applications/"];
    [url appendString:token];
    [url appendString:@"/videos/"];
    [url appendString:video_token];
    [url appendString:@"/image"];
    return [NSURL URLWithString:url];
}


@end