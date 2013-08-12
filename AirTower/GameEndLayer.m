//
//  GameEndLayer
//  AirTower
//
//  Created by lwh on 13-8-6.
//  Copyright air 2013年. All rights reserved.
//

#import "GameEndLayer.h"
#import "GameControl.h"

@implementation GameEndLayer

-(id)showWithGameResult:(int)result
{
	if( (self=[super init])) {
        
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        NSString *resultInfo = @"游戏结束\n嘿嘿，你好笨！";
        
        if(result == 1)
        {
            resultInfo = @"你过关了，好棒哦！";
        }
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:resultInfo fontName:@"Arial" fontSize:38];
        label.position = ccp(size.width/2, size.height/2);
        
		[self addChild: label];
	}
	
	return self;
}


@end
