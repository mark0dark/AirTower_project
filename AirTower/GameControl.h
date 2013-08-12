//
//  GameControl.h
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#define kWin 1
#define kFail 0

#import <Foundation/Foundation.h>
#import "Tower.h"
#import "Monster.h"
#import "GameLayer.h"

@class GameLayer;

@interface GameControl : NSObject

+(void)initMonsters:(id)container;
+(void)updateBullets;
+(void)updateMonsters;
+(void)hitCheck;
+(void)towersLockTarget;
+(void)setGameLayer:(GameLayer *)gameLayer;

+(void)gameEnd;

+(Tile *)clickedTile:(CGPoint)p;
+(id)gameLayer;

@end
