//
//  GameLayer.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/21/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "GameLayer.h"
#import "FirstScene.h"
@implementation GameLayer

+(CCScene*) scene {
    CCScene *scene = [CCScene node];
    GameLayer *layer = [GameLayer node];
    [scene addChild:layer];
    return scene;
}

-(id) init {
    
    if (self=[super init]) {
        
        // Initialize global variables
        winSize = [[CCDirector sharedDirector] winSize];
        self.touchEnabled = YES;
        playingData = [[PlayingData alloc] init];
        yourSymbol = [playingData getCurrentChosenSymbol];
        
        // Set background layer of game scene
        CCLayerColor *backgroundLayer = [CCLayerColor layerWithColor:ccc4(227,227,227,255)];
        [backgroundLayer setContentSize:CGSizeMake(winSize.width, winSize.height)];
        backgroundLayer.position = ccp(0,0);
        //backgroundLayer.anchorPoint = ccp(0.5f, 0.5f);
        [self addChild:backgroundLayer z:1];
        
        // Topbar layer with title
        CCLayerColor *tabBar = [CCLayerColor layerWithColor:ccc4(188, 188, 188, 255)];
        [tabBar setContentSize:CGSizeMake(winSize.width, 70)];
        tabBar.position = ccp(0, winSize.height-tabBar.contentSize.height);
        tabBar.anchorPoint = ccp(0,0);
        [self addChild:tabBar z:2];
        
        // Title on Topbar
        CCLabelTTF *titleOfScene = [CCLabelTTF labelWithString:@"(Tick Tack Tock) Game" fontName:@"Helvetica-Bold" fontSize:24];
        titleOfScene.color = ccc3(0, 0, 0);
        titleOfScene.position = ccp(tabBar.contentSize.width/2, winSize.height-(tabBar.contentSize.height/2));
        [self addChild:titleOfScene z:3];
        
        // Group of cells with controlling them
        cellsController = [[CellsController alloc] initWithSymbol:[playingData getCurrentChosenSymbol]];
        cellsController.position = ccp(0, winSize.height-(cellsController.contentSize.height+tabBar.contentSize.height+5));
        [cellsController createCells];
        [self addChild:cellsController z:3 tag:1000];
        
        // Display current player
        CCLayerColor *currentPlayer = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 255) width:winSize.width/2.55 height:30];
        currentPlayer.anchorPoint = ccp(0, 0);
        currentPlayer.position = ccp(0, 40);
        currentPlayerLabel = [CCLabelTTF labelWithString:@".. is playing" fontName:@"Helvetica-Bold" fontSize:18];
        currentPlayerLabel.anchorPoint = ccp(0, 0);
        currentPlayerLabel.position = ccp(5, 5);
        [currentPlayer addChild:currentPlayerLabel];
        [self addChild:currentPlayer z:3];
        
        
        // Set final message for winner
        gameStatusMessage = [CCLabelTTF labelWithString:@"" fontName:@"Helvetica-Bold" fontSize:30];
        gameStatusMessage.color = ccc3(0, 0, 0);
        gameStatusMessage.position = ccp(winSize.width/2, 100);
        gameStatusMessage.opacity = 0;
        [self addChild:gameStatusMessage z:3];
        
        // Schedule update method
        [self scheduleUpdate];
        
        // Create a main menu
        CCMenuItemImage *menuItem = [CCMenuItemImage itemWithNormalImage:@"main-menu-icon.png" selectedImage:@"main-menu-icon-selected.png" block:^(id sender) {
            [self menuOfTheGameWithAppear:YES];
        }];
        CCMenu *mainMenu = [CCMenu menuWithItems:menuItem, nil];
        mainMenu.anchorPoint = ccp(0,0);
        mainMenu.position = ccp(winSize.width-menuItem.contentSize.width/2 - 10, 55);
        [self addChild:mainMenu z:3];
        
        
        // Set computer symbol depend on your symbol (opposite of your symbol)
        if ([[playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Computer"]) {
            if ([yourSymbol isEqualToString:@"X"]) {
                compSymbol = @"O";
            } else {
                compSymbol = @"X";
            }
        }
        
        
    }
    
    return self;
}

-(void) menuOfTheGameWithAppear:(BOOL) appearTheMenu {
    
    if (appearTheMenu == YES) {
        
        /* Menu of the game */
        // Menu background
        menuBackground = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 255) width:winSize.width height:winSize.height];
        menuBackground.anchorPoint = ccp(0,0);
        menuBackground.position = ccp(0,0);
        //menuBackground.opacity = 0;
        
        // Menu item of game
        quitItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Quit" fontName:@"Helvetica-Bold" fontSize:30] block:^(id sender) {
            //[[CCDirector sharedDirector] resume];
            id fadeTransition = [CCTransitionSlideInL transitionWithDuration:0.6 scene:[FirstScene scene]];
            [[CCDirector sharedDirector] replaceScene:fadeTransition];
        }];
        quitItem.label.color = ccc3(255, 255, 255);
        
        repeatTheGameItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Repeat Game" fontName:@"Helvetica-Bold" fontSize:30] block:^(id sender) {
            [[menuBackground actionManager] removeAllActions];
            //[[CCDirector sharedDirector] resume];
            id fadeTransition = [CCTransitionFade transitionWithDuration:0.6 scene:[GameLayer scene]];
            [[CCDirector sharedDirector] replaceScene:fadeTransition];
        }];
        repeatTheGameItem.label.color = ccc3(255, 255, 255);
        
        continueItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Continue" fontName:@"Helvetica-Bold" fontSize:30] block:^(id sender) {
            [self menuOfTheGameWithAppear:NO];
        }];
        continueItem.label.color = ccc3(255, 255, 255);
        
        // Add 3 menu items in one menu
        CCMenu *menuOnPause = [CCMenu menuWithItems:quitItem, repeatTheGameItem, continueItem, nil];
        [menuOnPause alignItemsVerticallyWithPadding:20];
        menuOnPause.position = ccp(winSize.width/2, winSize.height/2);
        [menuBackground addChild:menuOnPause];
        [self addChild:menuBackground z:5];
        
        cellsController.touchEnabled = NO;
        
    } else {
        
        // Disappear with fade out action
        id fadeOutAction = [CCFadeOut actionWithDuration:0.3];
        
        // Remove menu background block
        CCCallBlock *removeBlackBackgroundChild = [CCCallBlock actionWithBlock:^{
            [self removeChild:menuBackground cleanup:YES];
        }];
        
        // Run a sequence above actions
        [menuBackground runAction:[CCSequence actions:fadeOutAction, removeBlackBackgroundChild, nil]];
        
        // Resume the game
        cellsController.touchEnabled = YES;
        
    }
    
}


/*
    Logical Methods
*/
-(void) update:(ccTime)delta {
    
    // Set a message when game is end
    if ([cellsController isGameEnd]) {
        [gameStatusMessage setString:[cellsController setDecisionMessage]];
        
        CCFadeIn *fadeAction = [CCFadeIn actionWithDuration:0.5];
        [gameStatusMessage runAction:fadeAction];
        
        
        [self unscheduleUpdate];
    } else {
        currentPlayerLabel.string = [NSString stringWithFormat:@"[%@] is playing", [cellsController getOwnerSymbol]];
    }
    
    // Set up pause menu effects
    if ([self.children indexOfObject:menuBackground] != NSNotFound) {
        
        if (quitItem.isSelected) {
            quitItem.label.color = ccc3(255, 255, 0);
        } else if (!quitItem.isSelected) {
            quitItem.label.color = ccc3(255, 255, 255);
        }
        
        if (repeatTheGameItem.isSelected) {
            repeatTheGameItem.label.color = ccc3(255, 255, 0);
        } else if (!repeatTheGameItem.isSelected) {
            repeatTheGameItem.label.color = ccc3(255, 255, 255);
        }
        
        if (continueItem.isSelected) {
            continueItem.label.color = ccc3(255, 255, 0);
        } else if (!continueItem.isSelected) {
            continueItem.label.color = ccc3(255, 255, 255);
        }
        
    }
    
    // Add computer playing structure here (for playing directly after your symbol)
    if ([[playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Computer"] && [[cellsController getOwnerSymbol] isEqualToString:compSymbol] && ![cellsController isGameEnd]) {
        cellsController.touchEnabled = NO;
        [self schedule:@selector(defenceAndAttackST)];
        //[self schedule:@selector(testAttack)];
    }

}

/*
    Computer logical methods for attacking and defences
*/

-(void) testAttack {
    [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:0] objectAtIndex:0] intValue]];
    
    
    cellsController.touchEnabled = YES;
    [cellsController setOwnerSymbol:yourSymbol];
    [self unschedule:@selector(testAttack)];
}

-(void) defenceAndAttackST {
    NSLog(@"[Defence Attack Bainize]");
    
    for (int i=0; i<[[cellsController getSeqTaggedCells] count]; i++) {
        
        // Attack to win
        if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:0 andSymbol:compSymbol] &&
            [cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:1 andSymbol:compSymbol] &&
            [cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:2 andSymbol:@""]) {
            
            [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:i] objectAtIndex:2] intValue]];
            break;
        } else if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:0 andSymbol:compSymbol] &&
                   [cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:1 andSymbol:@""] &&
                   [cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:2 andSymbol:compSymbol]) {
            
            [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:i] objectAtIndex:1] intValue]];
            break;
        } else if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:0 andSymbol:@""] &&
                   [cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:1 andSymbol:compSymbol] &&
                   [cellsController checkSeqTaggedCellValueWithByCornerIndex:i withItemIndex:2 andSymbol:compSymbol]) {
            
            [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:i] objectAtIndex:0] intValue]];
            break;
        } else {
            
            // Defence to prevent another side winning
            if (i == [[cellsController getSeqTaggedCells] count]-1) {
                NSLog(@"[Defence Area]");
                for (int j=0; j<[[cellsController getSeqTaggedCells] count]; j++) {
                    if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:0 andSymbol:yourSymbol] &&
                        [cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:1 andSymbol:yourSymbol] &&
                        [cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:2 andSymbol:@""]) {
                        
                        [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:j] objectAtIndex:2] intValue]];
                        break;
                    } else if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:0 andSymbol:yourSymbol] &&
                               [cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:1 andSymbol:@""] &&
                               [cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:2 andSymbol:yourSymbol]) {
                        
                        [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:j] objectAtIndex:1] intValue]];
                        break;
                    } else if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:0 andSymbol:@""] &&
                               [cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:1 andSymbol:yourSymbol] &&
                               [cellsController checkSeqTaggedCellValueWithByCornerIndex:j withItemIndex:2 andSymbol:yourSymbol]) {
                        
                        [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:j] objectAtIndex:0] intValue]];
                        break;
                    } else {
                        
                        // Attack normally
                        if (j == [[cellsController getSeqTaggedCells] count]-1) {
                            NSLog(@"[Attack Area]");
                            for (int c=0; c<[[cellsController getSeqTaggedCells] count]; c++) {
                                
                                if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:0 andSymbol:compSymbol] &&
                                    [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:1 andSymbol:@""] &&
                                    [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:2 andSymbol:@""]) {
                                    
                                    [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:c] objectAtIndex:2] intValue]];
                                    break;
                                } else if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:0 andSymbol:@""] &&
                                           [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:1 andSymbol:compSymbol] &&
                                           [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:2 andSymbol:@""]) {
                                    
                                    [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:c] objectAtIndex:0] intValue]];
                                    break;
                                } else if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:0 andSymbol:@""] &&
                                           [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:1 andSymbol:@""] &&
                                           [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:2 andSymbol:compSymbol]) {
                                    
                                    [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:c] objectAtIndex:0] intValue]];
                                    break;
                                } else {
                                    
                                    // First Attack
                                    if (c == [[cellsController getSeqTaggedCells] count]-1) {
                                        NSLog(@"[First Attack Area]");
                                        if ([cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:0 andSymbol:@""] &&
                                            [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:1 andSymbol:@""] &&
                                            [cellsController checkSeqTaggedCellValueWithByCornerIndex:c withItemIndex:2 andSymbol:@""]) {
                                            
                                            [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:c] objectAtIndex:0] intValue]];
                                            //break;
                                        } else {
                                            
                                            if([cellsController checkCellValueByTag:101 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:101];
                                            } else if ([cellsController checkCellValueByTag:102 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:102];
                                            } else if ([cellsController checkCellValueByTag:103 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:103];
                                            } else if ([cellsController checkCellValueByTag:104 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:104];
                                            } else if ([cellsController checkCellValueByTag:105 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:105];
                                            } else if ([cellsController checkCellValueByTag:106 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:106];
                                            } else if ([cellsController checkCellValueByTag:107 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:107];
                                            } else if ([cellsController checkCellValueByTag:108 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:108];
                                            } else if ([cellsController checkCellValueByTag:109 andSymbol:@""]) {
                                                [cellsController knockTheCellByTag:109];
                                            }
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    cellsController.touchEnabled = YES;
    [cellsController setOwnerSymbol:yourSymbol];
    [self unschedule:@selector(defenceAndAttackST)];
    
}

@end
