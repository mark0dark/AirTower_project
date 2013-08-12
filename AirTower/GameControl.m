//
//  GameControl.m
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//


#import "GameControl.h"
#import "GameEndLayer.h"


@implementation GameControl

static GameLayer *gLayer;

+(void)setGameLayer:(GameLayer *)gameLayer
{
    gLayer = gameLayer;
}

+(id)gameLayer
{
    return gLayer;
}


+(void)initMonsters:(id)container
{
    int i;
    
    static int monsterNum = 10;
    
    for (i = 0; i< monsterNum; i++)
    {
        Monster *monster = [Monster create];
        
        [monster setPosition:ccp(1 * 80.0 -20 , 0 - 50.0* i)];
        
        [container addChild:monster];
    } 
}


+(void)updateBullets
{
    Bullet *bullet;
    int i;
    
    for (i = 0;[Bullet bulletList] &&  i < [[Bullet bulletList] count]; i++)
    {
        bullet = [Bullet bulletList][i];
        if (bullet)
        {
            [bullet update];
        }
    }
}


+(void)updateMonsters
{
    Monster *monster;
    int i;
    
    for (i = 0;[Monster monsterList] &&  i < [[Monster monsterList] count]; i++)
    {
        monster = [Monster monsterList][i];
        if (monster)
        {
            [monster update];
        }
    }
}


+(Tile *)clickedTile:(CGPoint)p
{
    Tile *mTile;
    CGRect cp;
    CGPoint newPosition;
    
    for (Tile *tile in [TileMap tileList])
    {
        newPosition = [[CCDirector sharedDirector] convertToGL:tile.position];
        cp = CGRectMake(newPosition.x - 20, newPosition.y - 20,40, 40);
        
        if(CGRectContainsPoint(cp, p))
        {
            mTile = tile;
            break;
        }
    }
    
    return mTile;
}



+(void)hitCheck
{

    Bullet *bullet;
    int i;
    
    L:for(i = 0; [Bullet bulletList] && i < [[Bullet bulletList] count]; i++)
    {
        bullet = [Bullet bulletList][i];
    
        if(!bullet)
        {
        goto L;
        }
    
        Monster *monster;
        int j;
    
        for(j = 0; [Monster monsterList] && j < [[Monster monsterList] count]; j++)
        {
            monster = [Monster monsterList][j];
            CGRect rect = CGRectMake(monster.position.x - 20, monster.position.y + 20,40, 40);
            
            if(monster && CGRectContainsPoint(rect, bullet.position))
            {
            
                [bullet die];
                [monster die];
                goto L;
            }
        }
    }
}


+(void)towersLockTarget
{
    if (! [Tower towerList] || ! [Monster monsterList])
    {
        return;
    }
    
    Tower *tower;
    int i;
    
    for (i = 0; i < [[Tower towerList] count]; i++)
    {
        tower = [Tower towerList][i];
        
        [self chooseMonster:tower];
    }
}



+(void)gameEnd
{
    Monster *monster;
    int i;
    
    
    for (i = 0;[Monster monsterList] &&  i < [[Monster monsterList] count]; i++)
    {
        monster = [Monster monsterList][i];
        if (monster)
        {
            if(monster.pos.x == 10 && monster.position.y < 0)
            {
                [[GameControl gameLayer] killTimer];
                [GameLayer leaveScene:kFail];
            }
        }
    }
    
    if([GameControl fullMonstersKilled])
    {
        [[GameControl gameLayer] killTimer];
        [GameLayer leaveScene:kWin];
    }
}


/////private///

+(void)chooseMonster:(Tower *)tower
{
    Monster *monster;
    int i;
    
    for (i = 0; i< [[Monster monsterList] count]; i ++)
    {
        monster = [Monster monsterList][i];
        
        tower.target = nil;
        
        if([self calTowerMonsterDistance:tower AndMonster:monster] < tower.shootRange)
        {
            tower.target = monster;
            [tower fire];
        }
              
    }
}


+(float)calTowerMonsterDistance:(Tower *)tower AndMonster:(Monster *)monster
{
    float dis = sqrt(
                     (tower.pos.x - monster.pos.x) * (tower.pos.x - monster.pos.x)
                     + (tower.pos.y - monster.pos.y) * (tower.pos.y - monster.pos.y)
                     );
    return dis;
}

+(BOOL)fullMonstersKilled
{
    BOOL mBool = NO;
    
    if([[Monster monsterList] count] == 0)
    {
        mBool = YES;
    }
    return mBool;
}


@end
