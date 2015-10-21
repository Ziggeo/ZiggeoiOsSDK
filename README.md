Ziggeo iOS SDK Alpha
====================

## This repository is deprecated. See our new SDK here: http://github.com/Ziggeo/iOS-Client-SDK



Ziggeo API (http://ziggeo.com) allows you to integrate video recording and playback with only
two lines of code in your site, service or app. This is the iOS SDK repository. It's open source,
so if you want to improve on it, feel free to add a pull request.


## Setup

Preparations:
- Clone this library
- Run pod install
- Build the library

Your App:
- Create iOS App
- Copy all image assets from the library to your project
- Add the following header search paths (change path accordingly)
	- $SOURCE_ROOT/../ZiggeoiOsSDK
	- $SOURCE_ROOT/../ZiggeoiOsSDK/Pods/VideoCore
- Add the following frameworks
	- libc++.dylib
	- VideoToolbox.framework
	- CoreMedia.framework
	- AudioToolbox.framework
	- AVFoundation.framework
	- MediaPlayer.framework
- Add the following libraries as frameworks
	- libPods-VideoCore.a
	- libZiggeoiOsSDK.a


## Initialize Application

```
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [ZiggeoiOsSDK init:@"APPLICATION_TOKEN"];
    return YES;
}
```

## Player

```
    VideoPlayer *view = [[VideoPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    [self.view addSubview:view];
    [playerview setVideoToken:@"VIDEO_TOKEN"];
```

## Recorder

```
    VideoRecorder *view = [[VideoRecorder alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    [self.view addSubview:view];
```


## Contributors
- Gianluca di Maggio
- Oliver Friedmann


## License
MIT Software License.

Copyright (c) 2014-2105 Ziggeo
