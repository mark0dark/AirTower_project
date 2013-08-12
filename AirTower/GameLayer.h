//
//  GameLayer
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright air 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

#import "cocos2d.h"
#import "TileMap.h"
#import "GameControl.h"

@interface GameLayer : CCLayer
{
}
+(void)leaveScene:(int)result;
-(void)killTimer;
@end
