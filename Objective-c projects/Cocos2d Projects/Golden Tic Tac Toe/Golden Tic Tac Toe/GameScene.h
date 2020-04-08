//
//  GameScene.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "AppDelegate.h"
#import "CellsController.h"
#import "Popup.h"
@interface GameScene : CCScene {
    int endOfUpdate;
    BOOL isWinnerAnnounced;
    
    // Game values
    NSString *compSymbol;
    NSString *anotherPlayerSymbol;
    NSString *yourSymbol;
    AppDelegate *appDelegate;
    CellsController *cellsController;
    Popup *popup;
    
    // Nodes
    CCLabelTTF *gameStatusMessage;
    CCLabelTTF *currentPlayerLabel;
    CCNodeColor *menuBackground;
    
    // Pause menu items
    CCButton *quitButton;
    CCButton *repeatTheGameButton;
    CCButton *continueButton;
    
    // Other variables
    BOOL isMultiplayerQuitTheGame;
    BOOL isMultiplayerRepeatTheGame;
}
+(GameScene*) scene;
@end
