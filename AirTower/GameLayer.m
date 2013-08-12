//
//  GameLayer
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright air 2013年. All rights reserved.
//


#import "GameLayer.h"
#import "Bullet.h"
#import "GameEndLayer.h"

@implementation GameLayer


-(id) init
{
	if( (self=[super init]) ) {
	
        [self setTouchEnabled:YES];
        
        [self addChild:[TileMap node]];
        
        [GameControl initMonsters:self];
        
        //
        [self schedule:@selector(onLoop) interval:1/60];
    }
    
	return self;
}



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    Tile *tile;
    
    UITouch *touch = [touches anyObject];
    
    CGPoint p = [touch locationInView:[touch view]];
    
    tile = [GameControl clickedTile:p];
    
    if(tile && tile.type == 3)
    {
        [self makeTower:tile];
        
    }
}


-(void)onLoop
{
    [GameControl updateMonsters];
    [GameControl updateBullets];
    [GameControl hitCheck];
    [GameControl towersLockTarget];
    [GameControl gameEnd];
}


-(void)makeTower:(Tile *)tile
{
    if(tile.isOccupied)
    {
        return;
    }

    [Tower createByGridX:tile.gridX andGridY:tile.gridY];
    tile.isOccupied = YES;  
}


+(void)leaveScene:(int)result
{
    id layer = [GameEndLayer node];
    [layer showWithGameResult:result];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene: layer]];
}

-(void)killTimer
{
    [self unscheduleAllSelectors];
}

- (void) dealloc
{
	[super dealloc];
}

@end
