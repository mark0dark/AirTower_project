//
//  AppDelegate.h
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright air 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;

	CCDirectorIOS	*director_;						
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
