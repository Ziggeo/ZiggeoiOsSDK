Ziggeo iOS SDK Alpha
====================

Ziggeo API (http://ziggeo.com) allows you to integrate video recording and playback with only
two lines of code in your site, service or app. This is the iOS SDK repository. It's open source,
so if you want to improve on it, feel free to add a pull request.


## Setup

- Run "pod install"
- Open library
- Compile library 
- Add libZiggeoiOsSDK.a and libPods.a to list of frameworks
- Add Ziggeo library root folder to list of header includes (Header search paths)


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

Copyright (c) 2014 Ziggeo
