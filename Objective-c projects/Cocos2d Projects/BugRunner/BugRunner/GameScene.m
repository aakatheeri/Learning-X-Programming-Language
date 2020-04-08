//
//  GameScene.m
//  BugRunner
//
//  Created by Mohammed Alkatheeri on 7/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
		 CGSize screen = [[CCDirector sharedDirector] winSize];
        self.isTouchEnabled = YES;
        
        // Background of game
        CCSprite *background = [CCSprite spriteWithFile:@"Background.png"];
        background.position = ccp(screen.width/2 ,screen.height/2);
        [self addChild:background z:-1];
        
        // Initialize variables
        bugs = [[NSMutableArray alloc] initWithCapacity:20];
        
        [self schedule:@selector(addingBug) interval:1.0];
	}
	return self;
}

-(void)addingBug {
        
        CCSprite *ladyBug = [CCSprite spriteWithFile:@"Bug-1.png"]; 
        
        // Determine where to spawn the target along the Y axis
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        int minY = ladyBug.contentSize.width/2;
        int maxY = winSize.width - ladyBug.contentSize.width/2;
        int rangeY = maxY - minY;
        int random = (arc4random() % rangeY) + minY;
        
        // Create the target slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        ladyBug.position = ccp(random, -(ladyBug.contentSize.height));
        [self addChild:ladyBug];
        [bugs addObject:ladyBug];
        
        // Determine speed of the target
        int minDuration = 2.0;
        int maxDuration = 4.0;
        int rangeDuration = maxDuration - minDuration;
        int actualDuration = (arc4random() % rangeDuration) + minDuration;
        
        // Create the actions
        id actionMove = [CCMoveTo actionWithDuration:actualDuration position:ccp( random , winSize.height + ladyBug.contentSize.height)];   
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
        [ladyBug runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
        
}

-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    [self removeChild:sprite cleanup:YES];
}

-(void) ccTouchesBegan:(NSSet*)touches withEvent:(id)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]]; 
    location = [[CCDirector sharedDirector] convertToGL:location];
    location = [self convertToNodeSpace:location];
    
    for (CCSprite *bug in bugs) {
        
        if (CGRectContainsPoint(bug.boundingBox, location)) {
            NSLog(@"Touch of bug ..");
            bug.opacity = 0;
        }
        
    }
    

}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint location = [touch locationInView:[touch view]]; 
    location = [[CCDirector sharedDirector] convertToGL:location];
    location = [self convertToNodeSpace:location];

}
@end