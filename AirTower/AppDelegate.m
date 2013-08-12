//
//  AppDelegate.m
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright air 2013年. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
#import "IntroLayer.h"

@implementation MyNavigationController

-(NSUInteger)supportedInterfaceOrientations {
	
	if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
		return UIInterfaceOrientationMaskLandscape;
	
	return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
		return UIInterfaceOrientationIsLandscape(interfaceOrientation);
	
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

-(void) directorDidReshapeProjection:(CCDirector*)director
{
	if(director.runningScene == nil) {
		[director runWithScene: [IntroLayer node]];
	}
}
@end


@implementation AppController

@synthesize window=window_, navController=navController_, director=director_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	CCGLView *glView = [CCGLView viewWithFrame:[window_ bounds]
								   pixelFormat:kEAGLColorFormatRGB565
								   depthFormat:0
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
	
	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
	
	director_.wantsFullScreenLayout = YES;
	
	[director_ setDisplayStats:YES];
	
	[director_ setAnimationInterval:1.0/60];
	
	[director_ setView:glView];
	
	[director_ setProjection:kCCDirectorProjection2D];
	
	if( ! [director_ enableRetinaDisplay:YES] )
		CCLOG(@"Retina Display Not supported");
	
	
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	
    CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];
	
    [sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];
	
    [sharedFileUtils setiPadSuffix:@"-ipad"];					
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];
	
    [CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
	
	navController_ = [[MyNavigationController alloc] initWithRootViewController:director_];
	navController_.navigationBarHidden = YES;

	[director_ setDelegate:navController_];
	
	[window_ setRootViewController:navController_];
	
	[window_ makeKeyAndVisible];
	
	return YES;
}

-(void) applicationWillResignActive:(UIApplication *)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ pause];
}


-(void) applicationDidBecomeActive:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];	
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}


- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}


-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void) dealloc
{
	[window_ release];
	[navController_ release];
	
	[super dealloc];
}
@end
