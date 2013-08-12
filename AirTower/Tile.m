//
//  Tile.m
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "Tile.h"

@interface Tile()
@property(nonatomic,strong)CCSprite *bg;
@end



@implementation Tile

-(id)initWithType:(int)mtype
{
    if(self = [super init])
    {
        _type = mtype;
        
        if(!_bg)
        {
            _bg = [self createBg:_type];
            [self addChild:_bg];
        }
    }
    
    return self;
}

-(CCSprite *) createBg:(int)type
{
    NSString *bgURL = @"grass.png";
    
    if(type == 1)
    {
       bgURL = @"80x80.png";
    }
    else if(type == 3)
    {
        bgURL = @"ta.png";
    }
    
    CCSprite *sprite = [CCSprite spriteWithFile:bgURL rect:CGRectMake(0, 0, 38, 38)];
    
    return sprite;
}

-(void)draw
{
    ccDrawColor4F(100.0f, 100.0f, 100.0f, 100.0f);
    CGPoint vertices[] = {ccp(-20, -20),ccp(20,-20),ccp(20,20),ccp(-20,20)};
    ccDrawPoly(vertices, 4, YES);
    [super draw];
}
@end
