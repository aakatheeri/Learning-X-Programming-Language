//
//  ChoosePlayTypeScene.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "ChoosePlayTypeScene.h"
#import "ChooseSymbolScene.h"
#import "ConnectWithPeer.h"
#import "FirstScene.h"

@implementation ChoosePlayTypeScene
+(ChoosePlayTypeScene*) scene {
    return [[self alloc] init];
}

-(id) init {
    self=[super init];
    if(!self) return (nil);
    
    // Initial variables
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    // Initial background
    CCNodeColor *backgroundColor = [[CCNodeColor alloc] initWithColor:[CCColor colorWithCcColor3b:ccc3(255, 243, 193)]];
    backgroundColor.contentSize = self.contentSize;
    backgroundColor.position = ccp(0, 0);
    [self addChild:backgroundColor z:0];
    
    CCSprite *background = [CCSprite spriteWithImageNamed:@"background-iphone.png"]; // Background header
    background.position = ccp(self.contentSize.width/2, self.contentSize.height - background.contentSize.height/2);
    [self addChild:background z:1];
    
    // Choose play type title
    CCSprite *choosePlayType = [CCSprite spriteWithImageNamed:@"title-choose-playing-type-iphone.png"];
    choosePlayType.position = ccp(self.contentSize.width/2, 632/2);
    [self addChild:choosePlayType z:2];
    
    /*
        Choose type of game buttons
    */
    CCButton *onePlayerGame = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"one-player-game-button-iphone.png"]];
    [onePlayerGame setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"one-player-game-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [onePlayerGame setTarget:self selector:@selector(playWithComputer)];
    CCButton *twoPlayerGame = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"two-player-game-button-iphone.png"]];
    [twoPlayerGame setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"two-player-game-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [twoPlayerGame setTarget:self selector:@selector(playWithYourPartner)];
    CCButton *peerToPeerPlayerGame = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"peer-to-peer-game-button-iphone.png"]];
    [peerToPeerPlayerGame setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"peer-to-peer-game-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [peerToPeerPlayerGame setTarget:self selector:@selector(playWithLocalPlayer)];
    
    CCLayoutBox *playingTypeButtons = [[CCLayoutBox alloc] init];
    playingTypeButtons.anchorPoint = ccp(0.5,0.5);
    [playingTypeButtons addChild:peerToPeerPlayerGame z:0];
    [playingTypeButtons addChild:twoPlayerGame z:0];
    [playingTypeButtons addChild:onePlayerGame z:0];
    playingTypeButtons.spacing = 15.f;
    playingTypeButtons.direction = CCLayoutBoxDirectionVertical;
    [playingTypeButtons layout];
    playingTypeButtons.position = ccp(self.contentSize.width/2, choosePlayType.position.y - playingTypeButtons.contentSize.height/1.1);
    [self addChild:playingTypeButtons z:2];
    
    // Back button
    CCButton *backButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"back-button-iphone.png"]];
    [backButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"back-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [backButton setTarget:self selector:@selector(backSelector)];
    backButton.anchorPoint = ccp(0,0);
    backButton.position = ccp(0, 10);
    [self addChild:backButton z:2];
    
    return self;
}

-(void) playWithComputer {
    [appDelegate.playingData saveCurrentPlayingType:@"Computer"];
    //id transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0];
    [[CCDirector sharedDirector] replaceScene:[ChooseSymbolScene scene]];
}

-(void) playWithYourPartner {
    [appDelegate.playingData saveCurrentPlayingType:@"Partner"];
    //id transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0];
    [[CCDirector sharedDirector] replaceScene:[ChooseSymbolScene scene]];
}

-(void) playWithLocalPlayer {
    [appDelegate.playingData saveCurrentPlayingType:@"Multipeer"];
    //id transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0];
    [[CCDirector sharedDirector] replaceScene:[ConnectWithPeer scene]];
}

-(void) backSelector {
    //id transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0];
    [[CCDirector sharedDirector] replaceScene:[FirstScene scene]];
    
}
@end
