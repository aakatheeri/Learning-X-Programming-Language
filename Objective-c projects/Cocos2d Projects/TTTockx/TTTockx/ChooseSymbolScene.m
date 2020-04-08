//
//  ChooseSymbolScene.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 12/11/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "ChooseSymbolScene.h"
#import "PlayingData.h"
#import "FirstScene.h"
#import "GameLayer.h"

@implementation ChooseSymbolScene

+(CCScene*) scene {
    ChooseSymbolScene *chooseScene = [ChooseSymbolScene node];
    CCScene *scene = [CCScene node];
    [scene addChild:chooseScene];
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
        
        // Choose Label
        CCLabelTTF *chooseTitle = [CCLabelTTF labelWithString:@"Choose your symbol\nto play with:" fontName:@"MarkerFelt-Thin" fontSize:30];
        chooseTitle.color = ccc3(38, 12, 32);
        chooseTitle.position = ccp(winSize.width/2, titleBar.position.y - (chooseTitle.contentSize.height + 100));
        [self addChild:chooseTitle z:1];
        
        // Choose Button (X/O)
        xSym = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"(X)" fontName:@"MarkerFelt-Thin" fontSize:40] block:^(id sender) {
            [playingData saveCurrentSymbol:@"X"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFadeUp transitionWithDuration:0.6 scene:[GameLayer scene]]];
        }];

        oSym = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"(O)" fontName:@"MarkerFelt-Thin" fontSize:40] block:^(id sender) {
            [playingData saveCurrentSymbol:@"O"];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFadeUp transitionWithDuration:0.6 scene:[GameLayer scene]]];
        }];
        
        // Background of choose button
        CCMenu *symbols = [CCMenu menuWithItems:xSym, oSym, nil];
        symbols.position = ccp(winSize.width/2, winSize.height/2 - 60);
        [symbols alignItemsHorizontallyWithPadding:40];
        [self addChild:symbols z:2];
        
        CCLayerColor *xSymbolItemBackground = [[CCLayerColor alloc] initWithColor:ccc4(0, 0, 0, 255) width:xSym.contentSize.width + 20 height:xSym.contentSize.height + 20];
        xSymbolItemBackground.position = ccp(symbols.position.x - 75, symbols.position.y - xSymbolItemBackground.contentSize.height/2 + 3);
        [self addChild:xSymbolItemBackground z:1];
        
        CCLayerColor *oSymbolItemBackground = [[CCLayerColor alloc] initWithColor:ccc4(0, 0, 0, 255) width:xSym.contentSize.width + 20 height:xSym.contentSize.height + 20];
        oSymbolItemBackground.position = ccp(symbols.position.x + 10, symbols.position.y - xSymbolItemBackground.contentSize.height/2 + 3);
        [self addChild:oSymbolItemBackground];
        
        
        // Back button
        backItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Back" fontName:@"AvenirNextCondensed-Bold" fontSize:35] block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[FirstScene scene]]];
        }];
        backItem.color = ccc3(0, 0, 0);
        CCMenu *backButton = [CCMenu menuWithItems:backItem, nil];
        backButton.position = ccp(backItem.contentSize.width/1.5, backItem.contentSize.height/1.5
                                  );
        [self addChild:backButton z:1];
        
        // Schedule update
        [self scheduleUpdate];
        
        
    }
    
    return self;
}

-(void) update:(ccTime)delta {
    
    if(xSym.isSelected) {
        xSym.label.color = ccc3(255, 240, 138);
    } else {
        xSym.label.color = ccc3(255, 255, 255);
    }
    
    if(oSym.isSelected) {
        oSym.label.color = ccc3(255, 240, 138);
    } else {
        oSym.label.color = ccc3(255, 255, 255);
    }
    
    if (backItem.isSelected) {
        backItem.label.color = ccc3(153, 61, 49);
    } else {
        backItem.label.color = ccc3(0, 0, 0);
    }
    
}

@end
