//
//  Tower.h
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "Role.h"
#import "GameLayer.h"
#import "Monster.h"
#import "Bullet.h"
@class Bullet;

@interface Tower : Role

@property(nonatomic,strong) Monster *target;
@property(nonatomic) int shootRange;
@property(nonatomic,strong) Bullet *bullet;
@property(nonatomic) int shootRate;

+(NSMutableArray *)towerList;

+(void)createByGridX:(int)mGridX andGridY:(int)mGridY;
-(void)fire;

@end
