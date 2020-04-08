//
//  ConnectWithPeer.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "ConnectWithPeer.h"
#import "ChoosePlayTypeScene.h"
#import "ChooseSymbolScene.h"

@implementation ConnectWithPeer

+(ConnectWithPeer*) scene {
    return [[super alloc] init];
}

-(id) init {
    self=[super init];
    if(!self) return(nil);
    
    // Initialize variables
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    playMultipeerGame = nil;
    
    // Initial background
    CCNodeColor *backgroundColor = [[CCNodeColor alloc] initWithColor:[CCColor colorWithCcColor3b:ccc3(255, 243, 193)]];
    backgroundColor.contentSize = self.contentSize;
    backgroundColor.position = ccp(0, 0);
    [self addChild:backgroundColor z:0];
    
    CCSprite *background = [CCSprite spriteWithImageNamed:@"background-iphone.png"]; // Background header
    background.position = ccp(self.contentSize.width/2, self.contentSize.height - background.contentSize.height/2);
    [self addChild:background z:1];
    
    // Connect button
    connectButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-connect-iphone.png"]];
    [connectButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-connect-selected-iphone.png"] forState:CCControlStateHighlighted];
    [connectButton setTarget:self selector:@selector(connectSelector)];
    connectButton.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    [self addChild:connectButton z:1 name:@"1020"];
    
    // Disconnect button
    disconnectButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-disconnect-iphone.png"]];
    [disconnectButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-disconnect-selected-iphone.png"] forState:CCControlStateNormal];
    [disconnectButton setTarget:self selector:@selector(disconnectSelector)];
    disconnectButton.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    //[self addChild:disconnectButton z:1 name:@"1030"];
    
    // Current state message
    statusMessage = [CCLabelTTF labelWithString:@"Make sure another player has this game \nand he/she is in this view." fontName:@"AvenirNextCondensed-Bold" fontSize:15];
    statusMessage.color = [CCColor colorWithCcColor3b:ccc3(148, 52, 5)];
    statusMessage.position = ccp(self.contentSize.width/2, connectButton.position.y - 90);
    statusMessage.horizontalAlignment = CCTextAlignmentCenter;
    [self addChild:statusMessage z:1];
    
    // Back button
    CCButton *backButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"back-button-iphone.png"]];
    [backButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"back-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [backButton setTarget:self selector:@selector(backSelector)];
    backButton.anchorPoint = ccp(0,0);
    backButton.position = ccp(0, 10);
    [self addChild:backButton z:2];
    
    return self;
}

-(void) connectSelector {
    [appDelegate.mcManager connect];
}
-(void) disconnectSelector {
    [appDelegate.mcManager.session disconnect];
}

-(void) playMultipeerGameSelector {
    [[CCDirector sharedDirector] replaceScene:[ChooseSymbolScene scene]];
}

-(void) backSelector {
    //id transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0];
    [[CCDirector sharedDirector] replaceScene:[ChoosePlayTypeScene scene]];
    
}

-(void) update:(CCTime)delta {
    
    if ([self getChildByName:@"1020" recursively:YES] != nil && appDelegate.mcManager.isConnectMoved == YES) {
        
        // Change connect and disconnect buttons
        [self removeChildByName:@"1020"];
        [self addChild:disconnectButton z:1 name:@"1030"];
        statusMessage.opacity = 0;
        
        // Add Playing game button
        if(playMultipeerGame == nil) {
            playMultipeerGame = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-start-game-iphone.png"]];
            [playMultipeerGame setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-start-game-selected-iphone.png"] forState:CCControlStateHighlighted];
            playMultipeerGame.position = ccp(self.contentSize.width/2, self.contentSize.height/2 - (connectButton.contentSize.height*2));
            [playMultipeerGame setTarget:self selector:@selector(playMultipeerGameSelector)];
            [self addChild:playMultipeerGame z:1];
        }
        
        
    } else if ([self getChildByName:@"1030" recursively:YES] != nil && appDelegate.mcManager.isConnectMoved == NO) {
        
        // Change connect and disconnect buttons
        [self removeChildByName:@"1030"];
        [self addChild:connectButton z:1 name:@"1020"];
        statusMessage.opacity = 1;
        
        // Disconnect the session
        [appDelegate.mcManager.session disconnect];
        
        // Remove playing game button
        if(playMultipeerGame != nil) {
            [self removeChild:playMultipeerGame cleanup:YES];
            playMultipeerGame = nil;
        }
        
    }
    
}



@end
