//
//  Tower.m
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "Tower.h"

@interface Tower()
@property(nonatomic,strong) CCSprite *bg;
@property(nonatomic)int count;
@end

@implementation Tower

static NSMutableArray *towers;

-(id)init
{
    if(self = [super init])
    {
        _count = 0;
        _bg =[CCSprite spriteWithFile:@"tower.png"];
        [self addChild:_bg];
    }
    return  self;
}

+(void)createByGridX:(int)mGridX andGridY:(int)mGridY
{
    Tower *tower = [Tower node];
    
    tower.shootRate = 60;
    tower.shootRange = 3;
    
    tower.gridX = mGridX;
    tower.gridY = mGridY;
    
    CGPoint newPosition = ccp(mGridX * 40.0f + 20, mGridY * 40.0f + 20);    
    [tower setPosition:newPosition];
    
    if(!towers)
    {
        towers = [[NSMutableArray alloc] init];
    }
    
    [towers addObject:tower];
    
    [[GameControl gameLayer] addChild:tower];
}


+(NSMutableArray *)towerList
{
    return towers;
}


-(void)fire
{
    if(!_target)
    {
        return;
    }
    
    _count++;
    
    if(_count < self.shootRate)
    {
        return;
    }
    
        _bullet = [Bullet create];
        _bullet.createdBy = self;
        [_bullet calBulletRad:_bullet];
        [_bullet setPosition:self.position];
        [[GameControl gameLayer] addChild:_bullet];
    
    _count = 0;
}


@end
