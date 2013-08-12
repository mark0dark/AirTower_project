//
//  Bullet.m
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "Bullet.h"

@interface Bullet()
@property(nonatomic,strong) CCSprite *bg;
@property(nonatomic) CGSize winSize;
@end

@implementation Bullet

static NSMutableArray *bullets;

-(id)init
{
    if(self = [super init])
    {
        _bg = [CCSprite spriteWithFile:@"bullet.png"];
        [self addChild:_bg];
        
        _winSize = [[CCDirector sharedDirector] winSize];
    }
    return self;
}


+(Bullet *)create
{
    Bullet *bullet = [Bullet node];
    
    if(!bullets)
    {
        bullets = [[NSMutableArray alloc] init];
    }
    
    [bullets addObject:bullet];
    
    return bullet;
}


-(void)calBulletRad:(Bullet *)bullet
{
    if(!bullet || !bullet.createdBy || !bullet.createdBy.target)
    {
        return;
    }
    bullet.rad = atan2(bullet.createdBy.target.pos.y - bullet.createdBy.pos.y
                      , bullet.createdBy.target.pos.x - bullet.createdBy.pos.x);
}


+(NSMutableArray *)bulletList
{
    return bullets;
}


-(void)die
{
    if(![Bullet bulletList])
    {
        return;
    }
    
    for (CCSprite *obj in [Bullet bulletList]) {
        if([obj isEqual:self])
        {
            [[Bullet bulletList] removeObject:obj];
            
            if([self parent])
            {
                self.createdBy = nil;
                [self.createdBy release];
                [self removeAllChildrenWithCleanup:YES];
                [self removeFromParent];
                self = nil;
                [self release];
               
            }
             break;
        }
    }
    
}


-(void)update
{
    if(self.position.x > _winSize.width
       || self.position.y > _winSize.height
       || self.position.x < 0
       || self.position.y < 0)
    {
        [self die];
        return;
    }
    
    CGPoint newPosition;
    newPosition = self.position;
    newPosition.x += 2.0 * cos(_rad);
    newPosition.y += 2.0 * sin(_rad);
    [self setPosition:newPosition];
    
}


@end
