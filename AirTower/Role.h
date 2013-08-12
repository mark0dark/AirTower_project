//
//  Role.h
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "CCSprite.h"

@interface Role : CCSprite

@property(nonatomic) int gridX;
@property(nonatomic) int gridY;


-(CGPoint)pos;

-(void)update;

@end
