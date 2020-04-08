//
//  ChoosePlayTypeScene.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 2/17/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "ChoosePlayTypeScene.h"
#import "ConnectWithPeer.h"
#import "PlayingData.h"
#import "FirstScene.h"
#import "ChooseSymbolScene.h"

@implementation ChoosePlayTypeScene
+(CCScene*) scene {
    ChoosePlayTypeScene *layer = [ChoosePlayTypeScene node];
    CCScene *scene = [CCScene node];
    [scene addChild:layer];
    return scene;
}

-(id) init {
    
    if (self = [super init]) {
        
        // Initialize variables
        PlayingData *playingData = [[PlayingData alloc] init];
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
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
        
        // Choose type of game label
        CCLabelTTF *chooseTypeLabel = [CCLabelTTF labelWithString:@"Choose the way you want\n to play!" fontName:@"AvenirNextCondensed-Bold" fontSize:28];
        chooseTypeLabel.position = ccp(winSize.width/2, titleBar.position.y - 45);
        chooseTypeLabel.color = ccc3(0, 0, 0);
        [self addChild:chooseTypeLabel z:2];
        
        // Choose type of game menu
        CCMenuItemLabel *playWithComputer = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Play with computer" fontName:@"AvenirNextCondensed-Bold" fontSize:24] block:^(id sender) {
            [playingData saveCurrentPlayingType:@"Computer"];
            CCTransitionFadeUp *fadeUPTransition = [CCTransitionFadeUp transitionWithDuration:0.5 scene:[ChooseSymbolScene scene]];
            [[CCDirector sharedDirector] replaceScene:fadeUPTransition];
        }];
        playWithComputer.label.color = ccc3(0, 0, 0);
        
        CCMenuItemLabel *playWithYourPartner = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Play with your partner" fontName:@"AvenirNextCondensed-Bold" fontSize:24] block:^(id sender) {
            [playingData saveCurrentPlayingType:@"Partner"];
            CCTransitionFadeUp *fadeUPTransition = [CCTransitionFadeUp transitionWithDuration:0.5 scene:[ChooseSymbolScene scene]];
            [[CCDirector sharedDirector] replaceScene:fadeUPTransition];
        }];
        playWithYourPartner.label.color = ccc3(0, 0, 0);
        
        CCMenuItemLabel *playWithLocalPlayer = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Play with local multipeer player" fontName:@"AvenirNextCondensed-Bold" fontSize:24] block:^(id sender) {
            //[playingData saveCurrentPlayingType:@"Multipeer"];
            CCTransitionFadeUp *fadeUPTransition = [CCTransitionFadeUp transitionWithDuration:0.5 scene:[ConnectWithPeer scene]];
            [[CCDirector sharedDirector] replaceScene:fadeUPTransition];
        }];
        playWithLocalPlayer.label.color = ccc3(0, 0, 0);
        
        CCMenu *playTypeMenu = [CCMenu menuWithItems:playWithComputer, playWithYourPartner, playWithLocalPlayer, nil];
        playTypeMenu.position = ccp(chooseTypeLabel.position.x, chooseTypeLabel.position.y - 180);
        [playTypeMenu alignItemsVerticallyWithPadding:10];
        [self addChild:playTypeMenu z:3];
        
        
        // Back button
        CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Back" fontName:@"AvenirNextCondensed-Bold" fontSize:35] block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[FirstScene scene]]];
        }];
        backItem.color = ccc3(0, 0, 0);
        CCMenu *backButton = [CCMenu menuWithItems:backItem, nil];
        backButton.position = ccp(backItem.contentSize.width/1.5, backItem.contentSize.height/1.5
                                  );
        [self addChild:backButton z:1];
        
    }
    
    return self;
}

@end
