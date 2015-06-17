#import "ZiggeoiOsSDK.h"

@implementation ZiggeoiOsSDK

static NSString* token = @"";

+ (void)init:(NSString*)app_token
{
    token = app_token;
}

+ (NSString*) getToken {
    return token;
}

@end
