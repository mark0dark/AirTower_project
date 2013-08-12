//
//  IntroLayer.m
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright air 2013年. All rights reserved.
//

#import "IntroLayer.h"
#import "GameLayer.h"
#import "GameControl.h"

@implementation IntroLayer

-(id) init
{
	if( (self=[super init])) {

		CGSize size = [[CCDirector sharedDirector] winSize];

		CCSprite *background;
		
		background = [CCSprite spriteWithFile:@"Default.png"];
        background.rotation = 90;
		background.position = ccp(size.width/2, size.height/2);

		[self addChild: background];
	}
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
    
    id layer = [GameLayer node];
    [GameControl setGameLayer:layer];
    
    	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene: layer]];
}
@end
