//
//  Monster.m
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "Monster.h"

@interface Monster()
{
    CCSprite *bg;
}
@end


@implementation Monster

static NSMutableArray *monsters;

-(id)init
{
    if(self = [super init])
    {
        bg =[CCSprite spriteWithFile:@"monster.png"];
        [self addChild:bg];
    }
    return self;
}


-(void)update
{
    static float ratio = .5f;
    
    CGPoint newPosition;
    
    newPosition = self.position;
   
    if(self.position.x >= 10 * 40 + 20)
    {
        newPosition.y -= 2.0 * ratio;
    }
    else
    {
       if(self.position.y >= 6 * 40 + 20)
       {
           newPosition.x += 2.0 * ratio;
       }
        else
        {
            newPosition.y += 2.0 * ratio; 
        }
    }
    
    [self setPosition:newPosition];
}


+(Monster *)create
{
    Monster *monster = [Monster node];
    
    if(!monsters)
    {
        monsters = [[NSMutableArray alloc] init];
    }
    
    [monsters addObject:monster];
    
    return monster;
}


+(NSMutableArray *)monsterList
{
    return monsters;
}


-(void)die
{
    if(![Monster monsterList])
    {
        return;
    }
    
    for (CCSprite *obj in [Monster monsterList]) {
        if([obj isEqual:self])
        {
            [[Monster monsterList] removeObject:obj];
            
            if([obj parent])
            {
                [self removeAllChildrenWithCleanup:YES];
                [self removeFromParent];
                self = nil;
                [self release];
            }
            break;
        }
    }
}


-(CGPoint)pos
{
    self.gridX = (int)(self.position.x / 40);
    self.gridY = (int)(self.position.y / 40);
    
    return CGPointMake(self.gridX, self.gridY);
}

@end
