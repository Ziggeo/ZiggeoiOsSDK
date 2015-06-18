@interface UrlService : NSObject

+ (NSURL*)getVideoPath:(NSString*)video_token;
+ (NSURL*)getImagePath:(NSString*)video_token;
+ (NSURL*)postVideoPath:(NSString*)video_token stream:(NSString*)stream_token;
+ (NSURL*)postNewVideoPath;
+ (NSURL*)postNewStreamPath:(NSString*)video_token;
+ (NSString*)recordWowzaPath:(NSString*)video_token stream:(NSString*)stream_token;
+ (NSString*)recordWowzaServer;
+ (void) requestJSON:(NSURL*) url withMethod:(NSString*) method withTries:(int) tries completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *)) handler;
+ (void)postVideoRequest:(NSString*)video_token stream:(NSString*)stream_token completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *)) handler;
+ (void)postNewVideoRequest:(void (^)(NSURLResponse *, NSData *, NSError *)) handler;
+ (void)postNewStreamRequest:(NSString*)video_token completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *)) handler;

@end
