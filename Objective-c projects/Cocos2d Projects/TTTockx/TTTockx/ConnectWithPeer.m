//
//  ConnectWithPeer.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 3/16/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "ConnectWithPeer.h"
#import "ChoosePlayTypeScene.h"
@implementation ConnectWithPeer


+(CCScene*) scene {
    ConnectWithPeer *connectWithPeerScene = [ConnectWithPeer node];
    CCScene *scene = [CCScene node];
    [scene addChild:connectWithPeerScene];
    return scene;
}

-(id) init {
    
    if (self=[super init]) {
        
        // Initialize variables
        winSize = [[CCDirector sharedDirector] winSize];
        appDelegate = (AppController*)[[UIApplication sharedApplication] delegate];
        //[appDelegate.mcManager selectViewController:self];
        
        // Initial the background
        CCLayerColor *background = [CCLayerColor layerWithColor:ccc4(227,227,227,255) width:winSize.width height:winSize.height];
        background.anchorPoint = ccp(0, 0);
        background.position = ccp(0, 0);
        [self addChild:background];
        
        // Initial the header with game name
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"TTT Game" fontName:@"MarkerFelt-Thin" fontSize:50];
        title.color = ccc3(255, 255, 255);
        CCLayerColor *titleBar = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 255) width:winSize.width height:60];
        titleBar.position = ccp(0, winSize.height - titleBar.contentSize.height - 40);
        title.position = ccp (winSize.width/2, 28);
        [titleBar addChild:title z:2];
        [self addChild:titleBar z:1];
        
        // Connect Button
        connectButtonItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Connect" fontName:@"MarkerFelt-Thin" fontSize:60] block:^(id sender) {
            
            // MC connection goes here
            [appDelegate.mcManager connect];
            
        }];
        connectButtonItem.label.color = ccc3(0, 0, 0);
        connectButtonItem.tag = 1010;
        CCMenu *connectButton = [CCMenu menuWithItems: connectButtonItem, nil];
        connectButton.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:connectButton z:1 tag:1020];
        
        // Current state message
        statusMessage = [CCLabelTTF labelWithString:@"Make sure another player has this game \nand he/she is in this view." fontName:@"AvenirNextCondensed-Bold" fontSize:15];
        statusMessage.color = ccc3(0, 0, 0);
        statusMessage.position = ccp(winSize.width/2, connectButton.position.y - 90);
        [self addChild:statusMessage z:1];
        
        // Back button
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Back" fontName:@"AvenirNextCondensed-Bold" fontSize:35] block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[ChoosePlayTypeScene scene]]];
        }];
        backItem.color = ccc3(0, 0, 0);
        CCMenu *backButton = [CCMenu menuWithItems:backItem, nil];
        backButton.position = ccp(backItem.contentSize.width/1.5, backItem.contentSize.height/1.5
                                  );
        [self addChild:backButton z:1];
        
        [self scheduleUpdate];
        
    }
    
    return self;
    
}

-(void) update:(ccTime)delta {
    
    if ([connectButtonItem.label.string isEqualToString:@"Connect"] && appDelegate.mcManager.isConnectMoved == YES) {
        connectButtonItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Disconnect" fontName:@"MarkerFelt-Thin" fontSize:60] block:^(id sender) {
            [appDelegate.mcManager.session disconnect];
        }];
        connectButtonItem.label.color = ccc3(0, 0, 0);
        connectButtonItem.tag = 1010;
        
        CCMenu *connectButton = [CCMenu menuWithItems: connectButtonItem, nil];
        connectButton.position = ccp(winSize.width/2, winSize.height/2);
        
        [self removeChildByTag:1010];
        [self removeChildByTag:1020];
        [self addChild:connectButton z:1 tag:1020];

        
    } else if ([connectButtonItem.label.string isEqualToString:@"Disconnect"] && appDelegate.mcManager.isConnectMoved == NO) {
        
        [appDelegate.mcManager.session disconnect];
        
        connectButtonItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Connect" fontName:@"MarkerFelt-Thin" fontSize:60] block:^(id sender) {
            
            // MC connection goes here
            [appDelegate.mcManager connect];
            
        }];
        connectButtonItem.label.color = ccc3(0, 0, 0);
        connectButtonItem.tag = 1010;
        
        CCMenu *connectButton = [CCMenu menuWithItems: connectButtonItem, nil];
        connectButton.position = ccp(winSize.width/2, winSize.height/2);
        
        [self removeChildByTag:1010];
        [self removeChildByTag:1020];
        [self addChild:connectButton z:1 tag:1020];
        
    }
    
}


@end
