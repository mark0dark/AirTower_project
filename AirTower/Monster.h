//
//  Monster.h
//  AirTower
//
//  Created by lwh on 13-8-9.
//  Copyright (c) 2013年 air. All rights reserved.
//

#import "Role.h"

@interface Monster : Role

+(Monster *)create;
+(NSMutableArray *)monsterList;

-(void)die;

@end
