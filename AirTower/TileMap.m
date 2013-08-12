//
//  TileMap.m
//  AirTower
//
//  Created by lwh on 13-8-7.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "TileMap.h"

@interface TileMap()
{
    float SIZE;
}
@end


@implementation TileMap

static NSMutableArray *tiles;

-(id)init
{
    if (self = [super init]) {
      
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        SIZE = 40;
        
        int col = winSize.width / SIZE;
        int row = winSize.height / SIZE;
        
        Tile *tile;
        
        if(!tiles)
        {
            tiles = [[NSMutableArray alloc] init];
        }
        
        
        for(int i = 0;i < col * row;i++)
        {
            tile = [[Tile alloc] initWithType:[[Map getData][i] intValue]];
            tile.position = ccp(SIZE * (i % col) + SIZE/2, SIZE * ((int)(i / col)) + SIZE/2);
            tile.gridX = i % col;
            tile.gridY = (int)(i / col);
            tile.type = [[Map getData][i] intValue];
            [self addChild:tile];
            [tiles addObject:tile];
        }
        
    }
    
    return self;
}


+(NSMutableArray *)tileList
{
    return tiles;
}

@end
