//
//  GameLayer.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/21/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CellsController.h"
#import "PlayingData.h"
@interface GameLayer : CCLayer {
    
    // CG types
    CGSize winSize;
    
    // Game values
    NSString *compSymbol;
    NSString *yourSymbol;
    PlayingData *playingData;
    CellsController *cellsController;
    
    // Nodes
    CCLabelTTF *gameStatusMessage;
    CCLabelTTF *currentPlayerLabel;
    CCLayerColor *menuBackground;
    
    // Menu items
    CCMenuItemLabel *quitItem;
    CCMenuItemLabel *repeatTheGameItem;
    CCMenuItemLabel *continueItem;
}
+(CCScene*) scene;
@end
