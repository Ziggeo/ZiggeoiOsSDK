//
//  ZiggeoiOsSDK.m
//  ZiggeoiOsSDK
//
//  Created by Oliver Friedmann on 23/04/14.
//  Copyright (c) 2014 Ziggeo. All rights reserved.
//

#import "ZiggeoiOsSDK.h"

@implementation ZiggeoiOsSDK

static NSString* embedServerUri = @"http://embed.ziggeo.com";
static NSString* wowzaPlayUri = @"http://wowza.ziggeo.com:1935/vod/_definst_";
static NSString* wowzaServerUri = @"rtmp://wowza.ziggeo.com:1935/record/_definst_";

static NSString* token = @"";

+ (void)init:(NSString*)app_token
{
    token = app_token;
}

+ (NSURL*)getVideoPath:(NSString*)video_token
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/applications/%@/videos/%@/video.mp4/playlist.m3u8", wowzaPlayUri, token, video_token]];
}

+ (NSURL*)getImagePath:(NSString*)video_token;
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos/%@/image", embedServerUri, token, video_token]];
}

+ (NSURL*)postVideoPath:(NSString*)video_token stream:(NSString*)stream_token
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos/%@/streams/%@/recordersubmit", embedServerUri, token, video_token, stream_token]];
}

+ (NSURL*)postNewVideoPath
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos?flash_recording=true", embedServerUri, token]];
}

+ (NSURL*)postNewStreamPath:(NSString*)video_token;
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos/%@/streams?flash_recording=true", embedServerUri, token, video_token]];
}

+ (NSString*)recordWowzaPath:(NSString*)video_token stream:(NSString*)stream_token
{
    return [NSString stringWithFormat:@"applications___%@___videos___%@___streams___%@___video.mp4", token, video_token, stream_token];
}

+ (NSString*)recordWowzaServer
{
    return wowzaServerUri;
}


@end
