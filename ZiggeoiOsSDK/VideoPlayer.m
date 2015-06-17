#import "VideoPlayer.h"
#import "AsyncImageView.h"
#import "UrlService.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import <MediaPlayer/MPMoviePlayerViewController.h>

@implementation VideoPlayer {

MPMoviePlayerViewController *movieController;
AsyncImageView *imgview;
UIButton *playbutton;
NSString *token;

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgview = [[AsyncImageView alloc] initWithFrame:frame];
        [imgview setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:imgview];
        playbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 96, 96)];
        playbutton.center = self.center;
        [playbutton setImage:[UIImage imageNamed:@"button_play_solid"] forState:UIControlStateNormal];
        [playbutton addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:playbutton];
    }
    return self;
}

- (void)setVideoToken:(NSString*)video_token
{
    token = video_token;
    [imgview loadImageFromURL:[UrlService getImagePath:token]];
    movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:[UrlService getVideoPath:token]];
}

- (void)play
{
    [self.window.rootViewController presentMoviePlayerViewControllerAnimated:movieController];
    [movieController.moviePlayer play];
}

@end