#import "UrlService.h"
#import "ZiggeoiOsSDK.h"

@implementation UrlService

static NSString* embedServerUri = @"http://embed.ziggeo.com";
static NSString* embedCdnServerUri = @"http://embed-cdn.ziggeo.com";
static NSString* wowzaPlayUri = @"http://wowza.ziggeo.com:1935/vod/_definst_";
static NSString* wowzaServerUri = @"rtmp://wowza.ziggeo.com:1935/record/_definst_";

+ (NSURL*)getVideoPath:(NSString*)video_token
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/applications/%@/videos/%@/video.mp4/playlist.m3u8", wowzaPlayUri, [ZiggeoiOsSDK getToken], video_token]];
}

+ (NSURL*)getImagePath:(NSString*)video_token;
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos/%@/image", embedCdnServerUri, [ZiggeoiOsSDK getToken], video_token]];
}

+ (NSURL*)postVideoPath:(NSString*)video_token stream:(NSString*)stream_token
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos/%@/streams/%@/recordersubmit", embedServerUri, [ZiggeoiOsSDK getToken], video_token, stream_token]];
}

+ (NSURL*)postNewVideoPath
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos?flash_recording=true", embedServerUri, [ZiggeoiOsSDK getToken]]];
}

+ (NSURL*)postNewStreamPath:(NSString*)video_token;
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/v1/applications/%@/videos/%@/streams?flash_recording=true", embedServerUri, [ZiggeoiOsSDK getToken], video_token]];
}

+ (NSString*)recordWowzaPath:(NSString*)video_token stream:(NSString*)stream_token
{
    return [NSString stringWithFormat:@"applications___%@___videos___%@___streams___%@___video.mp4", [ZiggeoiOsSDK getToken], video_token, stream_token];
}

+ (NSString*)recordWowzaServer
{
    return wowzaServerUri;
}

+ (void) requestJSON:(NSURL*) url withMethod:(NSString*) method withTries:(int) tries completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *)) handler {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:method];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection
     sendAsynchronousRequest:request
     queue:queue
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
         if ((tries <= 0) || (error == nil && data.length > 0))
             handler(response, data, error);
         else
             [self requestJSON:url withMethod:method withTries:tries - 1 completionHandler: handler];
     }];
}

+ (void) postVideoRequest:(NSString*)video_token stream:(NSString*)stream_token completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *)) handler {
    [self requestJSON:[self postVideoPath:video_token stream:stream_token] withMethod:@"POST" withTries:10 completionHandler:handler];
}

+ (void) postNewVideoRequest:(void (^)(NSURLResponse *, NSData *, NSError *)) handler {
    [self requestJSON:[self postNewVideoPath] withMethod:@"POST" withTries:10 completionHandler:handler];
}

+ (void) postNewStreamRequest:(NSString*)video_token completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *)) handler {
    [self requestJSON:[self postNewStreamPath:video_token] withMethod:@"POST" withTries:10 completionHandler:handler];
}


@end
