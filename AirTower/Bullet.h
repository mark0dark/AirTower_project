//
//  Bullet.h
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "cocos2d.h"
#import "Role.h"
#import "Tower.h"
#import "Monster.h"

@class Role;
@class Tower;


@interface Bullet : Role

@property(nonatomic,strong) Tower *createdBy;
@property(nonatomic) float rad;

+(Bullet *)create;
+(NSMutableArray *)bulletList;

-(void)die;
-(void)calBulletRad:(Bullet *)bullet;

@end
