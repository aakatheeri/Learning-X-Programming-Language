//
//  HelloWorldLayer.m
//  BugRunner
//
//  Created by Mohammed Alkatheeri on 7/7/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "MainMenuScene.h"
#import "GameScene.h"

// HelloWorldLayer implementation
@implementation MainMenuScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuScene *layer = [MainMenuScene node];
	
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
        
        CCSprite *background = [CCSprite spriteWithFile:@"Background.png"];
        background.position = ccp(screen.width/2 ,screen.height/2);
        [self addChild:background z:-1];
        
        CCSprite *logo = [CCSprite spriteWithFile:@"Logo.png"];
        logo.position = ccp(screen.width/2 ,screen.height/2);
        [self addChild:logo z:1];
        
        CCMenuItemImage *playButton = [CCMenuItemImage itemFromNormalImage:@"PlayButton.png" selectedImage:@"PlayButton.png" target:self selector:@selector(playSelector)];
        CCMenuItemImage *howToButton = [CCMenuItemImage itemFromNormalImage:@"HowToButton.png" selectedImage:@"HowToButton.png" target:self selector:@selector(howToSelector)];
        CCMenuItemImage *myColiction = [CCMenuItemImage itemFromNormalImage:@"MyColiction.png" selectedImage:@"MyColiction.png" target:self selector:@selector(myColictionSelector)];
        CCMenu *mainMenu = [CCMenu menuWithItems:playButton, howToButton, myColiction, nil];
        mainMenu.position = ccp(screen.width/2, 150);
        [mainMenu alignItemsVerticallyWithPadding:0];
        [self addChild:mainMenu z:0];
	}
	return self;
}

-(void) playSelector{
    [[CCDirector sharedDirector] replaceScene:[GameScene node]];
}
-(void) howToSelector{

}
-(void) myColictionSelector{
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
