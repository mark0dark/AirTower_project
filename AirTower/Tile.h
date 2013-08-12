//
//  Tile.h
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "cocos2d.h"

@interface Tile : CCSprite

@property(nonatomic) int type;

@property(nonatomic) int gridX;
@property(nonatomic) int gridY;

@property(nonatomic) BOOL isOccupied;

-(id)initWithType:(int)mtype;

@end
