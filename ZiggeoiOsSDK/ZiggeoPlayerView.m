//
//  ZiggeoVideoPlayer.m
//  ZiggeoiOsSDK
//
//  Created by Oliver Friedmann on 24/04/14.
//  Copyright (c) 2014 Ziggeo. All rights reserved.
//

#import "ZiggeoPlayerView.h"
#import "AsyncImageView.h"
#import "ZiggeoiOsSDK.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import <MediaPlayer/MPMoviePlayerViewController.h>

@implementation ZiggeoPlayerView

MPMoviePlayerViewController *movieController;
AsyncImageView *imgview;
UIButton *playbutton;
NSString *token;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgview = [[AsyncImageView alloc] initWithFrame:frame];
        [imgview setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:imgview];
        playbutton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 96, 96)];
        playbutton.center = self.center;
        [playbutton setImage:[UIImage imageNamed:@"button_play"] forState:UIControlStateNormal];
        [playbutton addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:playbutton];
    }
    return self;
}

- (void)attach:(NSString*)video_token
{
    token = video_token;
    [imgview loadImageFromURL:[ZiggeoiOsSDK getImagePath:token]];
    movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:[ZiggeoiOsSDK getVideoPath:token]];
}

- (void)play
{
    [self.window.rootViewController presentMoviePlayerViewControllerAnimated:movieController];
    [movieController.moviePlayer play];
}

@end
