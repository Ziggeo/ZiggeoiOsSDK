@interface UrlService : NSObject

+ (NSURL*)getVideoPath:(NSString*)video_token;
+ (NSURL*)getImagePath:(NSString*)video_token;
+ (NSURL*)postVideoPath:(NSString*)video_token stream:(NSString*)stream_token;
+ (NSURL*)postNewVideoPath;
+ (NSURL*)postNewStreamPath:(NSString*)video_token;
+ (NSString*)recordWowzaPath:(NSString*)video_token stream:(NSString*)stream_token;
+ (NSString*)recordWowzaServer;

@end
