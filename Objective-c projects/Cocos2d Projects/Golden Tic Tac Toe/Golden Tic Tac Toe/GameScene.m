//
//  GameScene.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "GameScene.h"
#import "FirstScene.h"

@implementation GameScene
+(GameScene*) scene {
    return [[self alloc] init];
}

-(id) init {
    self = [super init];
    if(!self) return(nil);
    
    // Initialize global variables
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    endOfUpdate = 0;
    isMultiplayerQuitTheGame = NO;
    isMultiplayerRepeatTheGame = NO;
    isWinnerAnnounced = NO;
    
    // Set symbols depending on game playing type
    if ([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Computer"]) {
        yourSymbol = [appDelegate.playingData getCurrentChosenSymbol];
        if ([yourSymbol isEqualToString:@"X"]) {
            compSymbol = @"O";
        } else {
            compSymbol = @"X";
        }
    } else if ([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"] && [appDelegate.mcManager isConnected]) {
        yourSymbol = [appDelegate.mcManager.yourSymbolChoise substringWithRange:NSMakeRange(1, 1)];
        anotherPlayerSymbol = [appDelegate.mcManager.anotherPlayerSymbolChoise substringWithRange:NSMakeRange(1, 1)];
        [appDelegate.mcManager sendToPeer:@"[anotherPlayerStatus: In The Game]"];
    } else if ([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Partner"]) {
        yourSymbol = [appDelegate.playingData getCurrentChosenSymbol];
    }
    
    // Initial background
    CCNodeColor *backgroundColor = [[CCNodeColor alloc] initWithColor:[CCColor colorWithCcColor3b:ccc3(255, 243, 193)]];
    backgroundColor.contentSize = self.contentSize;
    backgroundColor.position = ccp(0, 0);
    [self addChild:backgroundColor z:0];
    
    CCSprite *background = [CCSprite spriteWithImageNamed:@"game-scene-background-iphone.png"]; // Background header
    background.position = ccp(self.contentSize.width/2, self.contentSize.height - background.contentSize.height/2);
    [self addChild:background z:1];
    
    // Background of cells
    CCSprite *cellsBackground = [CCSprite spriteWithImageNamed:@"game-board-cells-iphone.png"];
    cellsBackground.position = ccp(11, (self.contentSize.height - background.contentSize.height*3) + 1);
    cellsBackground.anchorPoint = ccp(0, 0);
    [self addChild:cellsBackground z:2];
    
    // Group of cells with controlling them
    cellsController = [[CellsController alloc] init];
    if([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"] && [appDelegate.mcManager isConnected]) {
        if (appDelegate.mcManager.shouldIStartFirst == YES) {
            [cellsController setOwnerSymbol:yourSymbol];
        } else {
            [cellsController setOwnerSymbol:anotherPlayerSymbol];
        }
        
    } else {
        [cellsController setOwnerSymbol:[appDelegate.playingData getCurrentChosenSymbol]];
    }
    cellsController.position = ccp(0, self.contentSize.height-background.contentSize.height*3);
    [cellsController createCells];
    [self addChild:cellsController z:3 name:@"1000"];
    
    // Current player status
    CCNodeColor *backgroundOfStatus = [CCNodeColor nodeWithColor:[CCColor colorWithCcColor3b:ccc3(255, 185, 0)]];
    backgroundOfStatus.anchorPoint = ccp(0, 0);
    backgroundOfStatus.position = ccp(0, 130/2);
    backgroundOfStatus.contentSize = CGSizeMake(390/2, 60/2);
    
    currentPlayerLabel = [CCLabelTTF labelWithString:@".. is playing" fontName:@"Helvetica-Bold" fontSize:16];
    currentPlayerLabel.anchorPoint = ccp(0, 0);
    currentPlayerLabel.position = ccp(5, 5);
    [backgroundOfStatus addChild:currentPlayerLabel];
    [self addChild:backgroundOfStatus z:2];
    
    // Other buttons on bottom
    CCButton *menuButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"menu-button-iphone.png"]];
    [menuButton setTarget:self selector:@selector(menuSelector)];
    [menuButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"menu-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    CCButton *achievementButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"achievement-button-iphone.png"]];
    [achievementButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"achievement-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    
    CCLayoutBox *otherButtons = [[CCLayoutBox alloc] init];
    otherButtons.anchorPoint = ccp(0,0);
    [otherButtons addChild:achievementButton z:0];
    [otherButtons addChild:menuButton z:0];
    otherButtons.spacing = 15.f;
    otherButtons.direction = CCLayoutBoxDirectionHorizontal;
    [otherButtons layout];
    otherButtons.position = ccp(self.contentSize.width - otherButtons.contentSize.width - 13, backgroundOfStatus.position.y);
    [self addChild:otherButtons z:2];
    
    // Initial popup
    popup = [[Popup alloc] initWithContentSize:self.contentSize];
    popup.position = ccp(0, 0);
    [self addChild:popup z:5];
    popup.isPlayerRepeatTheGame = NO;
    
    if ([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"] && [appDelegate.mcManager isConnected]) {
        NSLog(@"[Your Symbol is %@ / Another Symbol is %@]", yourSymbol, anotherPlayerSymbol);
    }
    
    return self;
}

-(void) showAchievementSelector {
    
}

-(void) quitSelector {
    if ([appDelegate.mcManager isConnected] && [[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
        appDelegate.mcManager.anotherPlayerSymbolChoise = @"";
        appDelegate.mcManager.yourSymbolChoise = @"";
        appDelegate.mcManager.shouldIStartFirst = nil;
        [appDelegate.mcManager sendToPeer:@"[anotherPlayerStatus: Quit The Game]"];
    }
    id fadeTransition = [CCTransition transitionFadeWithColor:[CCColor blackColor] duration:0.4];
    [[CCDirector sharedDirector] replaceScene:[FirstScene scene] withTransition:fadeTransition];
}

-(void) repeatTheGameMainSelector {
    
    if ([appDelegate.mcManager isConnected] && [[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
        [appDelegate.mcManager sendToPeer:@"[anotherPlayerStatus: Repeat The Game]"];
    }
    [self repeatTheGameSceneSelector];
}
-(void) repeatTheGameSceneSelector {
    id fadeTransition = [CCTransition transitionFadeWithColor:[CCColor blackColor] duration:0.4];
    [[CCDirector sharedDirector] replaceScene:[GameScene scene] withTransition:fadeTransition];
}
-(void) continueSelector {
    [self menuOfTheGameWillDisappear];
}

-(void) menuSelector {
    [popup showPopupWithType:@"menuOfGame"];
}

-(void) menuOfTheGameWillAppear {
    /* Menu of the game */
    // Menu background
    menuBackground = [[CCNodeColor alloc] initWithColor:[CCColor blackColor] width:self.contentSize.width height:self.contentSize.height];
    menuBackground.anchorPoint = ccp(0,0);
    menuBackground.position = ccp(0,0);
    //menuBackground.opacity = 0;
    
    // Menu item of game
    quitButton = [CCButton buttonWithTitle:@"Quit" fontName:@"Helvetica-Bold" fontSize:30];
    quitButton.color = [CCColor whiteColor];
    [quitButton setTarget:self selector:@selector(quitSelector)];
    
    repeatTheGameButton = [CCButton buttonWithTitle:@"Repeat Game" fontName:@"Helvetica-Bold" fontSize:30];
    repeatTheGameButton.color = [CCColor whiteColor];
    [repeatTheGameButton setTarget:self selector:@selector(repeatTheGameMainSelector)];
    
    continueButton = [CCButton buttonWithTitle:@"Continue" fontName:@"Helvetica-Bold" fontSize:30];
    continueButton.color = [CCColor whiteColor];
    [continueButton setTarget:self selector:@selector(continueSelector)];
    
    // Add 3 menu items in one menu
    CCLayoutBox *menu =[[CCLayoutBox alloc] init];
    menu.anchorPoint = ccp(0.5, 0.5);
    [menu addChild:quitButton];
    [menu addChild:repeatTheGameButton];
    [menu addChild:continueButton];
    menu.spacing = 10.f;
    menu.direction = CCLayoutBoxDirectionVertical;
    [menu layout];
    menu.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    [menuBackground addChild:menu];
    [self addChild:menuBackground z:5];
    
    cellsController.userInteractionEnabled = NO;
}
-(void) menuOfTheGameWillDisappear {
    // Disappear with fade out action
    id fadeOutAction = [CCActionFadeOut actionWithDuration:0.3];
    
    // Remove menu background block
    CCActionCallBlock *removeBlackBackgroundChild = [CCActionCallBlock actionWithBlock:^{
        [self removeChild:menuBackground cleanup:YES];
    }];
    
    // Run a sequence above actions
    [menuBackground runAction:[CCActionSequence actions:fadeOutAction, removeBlackBackgroundChild, nil]];
    
    // Resume the game
    cellsController.userInteractionEnabled = YES;
}
-(void) forceRepeatOfTheGameViewWillAppear {
    isMultiplayerRepeatTheGame = YES;
    appDelegate.mcManager.anotherPlayerRepeatTheGame = NO;
    
    CCNodeColor *repeatBackground = [[CCNodeColor alloc] initWithColor:[CCColor blackColor] width:self.contentSize.width height:self.contentSize.height];
    repeatBackground.anchorPoint = ccp(0,0);
    repeatBackground.position = ccp(0, 0);
    
    CCLabelTTF *repeatWarning = [CCLabelTTF labelWithString:@"Another player repeated \n this game, you have to \n play it again with him/her" fontName:@"Helvetica-Bold" fontSize:22];
    repeatWarning.horizontalAlignment = CCTextAlignmentCenter;
    repeatWarning.color = [CCColor whiteColor];
    repeatWarning.position = ccp(self.contentSize.width/2, (self.contentSize.height/2) + 20);
    [repeatBackground addChild:repeatWarning];
    
    CCButton *repeatButton = [CCButton buttonWithTitle:@"Repeat The Game" fontName:@"Helvetica-Bold" fontSize:32];
    repeatButton.position = ccp(self.contentSize.width/2, self.contentSize.height/2 - repeatWarning.contentSize.height);
    repeatButton.color = [CCColor yellowColor];
    [repeatButton setTarget:self selector:@selector(repeatTheGameSceneSelector)];
    [repeatBackground addChild:repeatButton];
    
    [self addChild:repeatBackground z:5];
    cellsController.userInteractionEnabled = NO;
}

/*
 Logical Methods
 */
-(void) update:(CCTime)delta {
    
    if (endOfUpdate == 0) {
        // Set a message when game is end
        if ([cellsController isGameEnd] && isWinnerAnnounced == NO) {
            [gameStatusMessage setString:[cellsController setDecisionMessage]];
            
            id fadeAction = [CCActionFadeIn actionWithDuration:0.5];
            [gameStatusMessage runAction:fadeAction];
            isWinnerAnnounced = YES;
            //endOfUpdate = 1;
        } else {
            currentPlayerLabel.string = [NSString stringWithFormat:@"[%@] is playing", [cellsController getOwnerSymbol]];
        }
        
        // Set up pause menu effects
        if ([self.children indexOfObject:menuBackground] != NSNotFound) {
            
            if (quitButton.selected) {
                quitButton.color = [CCColor yellowColor];
            } else if (!quitButton.selected) {
                quitButton.color = [CCColor whiteColor];
            }
            
            if (repeatTheGameButton.selected) {
                repeatTheGameButton.color = [CCColor yellowColor];
            } else if (!repeatTheGameButton.selected) {
                repeatTheGameButton.color = [CCColor whiteColor];
            }
            
            if (continueButton.selected) {
                continueButton.color = [CCColor yellowColor];
            } else if (!continueButton.selected) {
                continueButton.color = [CCColor whiteColor];
            }
            
        }
        
        if (isWinnerAnnounced == NO) {
            
            // Add computer playing structure here (for playing directly after your symbol)
            if ([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Computer"] && [[cellsController getOwnerSymbol] isEqualToString:compSymbol] && ![cellsController isGameEnd]) {
                cellsController.userInteractionEnabled = NO;
                [self schedule:@selector(defenceAndAttackST) interval:0.1];
            }
            
            // Add multipeer playing structure here (pause your playing until another side is played + recieved knocking of cell)
            if ([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"] && [[cellsController getOwnerSymbol] isEqualToString:anotherPlayerSymbol] && ![cellsController isGameEnd] && [appDelegate.mcManager isConnected]) {
                
                // Prevent player to knock cell until another one knock his cell
                if (cellsController.userInteractionEnabled == YES) {
                    cellsController.userInteractionEnabled = NO;
                }
                
                // Knock the cell if there any recieved cell knocking from another player
                if ([appDelegate.mcManager isThereAnyRecievingSymbolAndCellTag]) {
                    [cellsController knockTheCellByTag:[appDelegate.mcManager.temporaryGivenCellTagFromPeer intValue]];
                    //cellsController.userInteractionEnabled = YES;
                    [cellsController setOwnerSymbol:yourSymbol];
                    appDelegate.mcManager.temporaryGivenCellTagFromPeer = @"";
                    appDelegate.mcManager.temporaryGivenSymbolFromPeer = @"";
                }
            }
            
            // Alert a message if another player quit the game
            if(isMultiplayerQuitTheGame == NO && [appDelegate.mcManager.anotherPlayerGameStatus isEqualToString:@"Quit The Game"] && [appDelegate.mcManager isConnected] && [[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
                isMultiplayerQuitTheGame = YES;
                UIAlertView *warningAboutAnotherPlayerStatus = [[UIAlertView alloc] initWithTitle:@"You are alone in game" message:@"Another player is quit this game, you shuold tell him/her to play with you if you want continue playing with him/her" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [warningAboutAnotherPlayerStatus show];
                NSLog(@"[Should force quit]");
            }
            
        }
        
        // Alert the message if another player repeat the game
        if (isMultiplayerRepeatTheGame == NO && appDelegate.mcManager.anotherPlayerRepeatTheGame == YES && [appDelegate.mcManager isConnected] && [[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
            
            [popup showPopupWithType:@"forceOfGameRepeat"];
            isMultiplayerRepeatTheGame = YES;
            
            //[self forceRepeatOfTheGameViewWillAppear];
            NSLog(@"[Should force repeat]");
            
        }
        
        
    }
    
    if ([popup isPopupShow]) {
        cellsController.userInteractionEnabled = NO;
    } else {
        cellsController.userInteractionEnabled = YES;
    }
}

/*
 Computer logical methods for attacking and defences
 */

-(void) testAttack {
    [cellsController knockTheCellByTag:[[[[cellsController getSeqTaggedCells] objectAtIndex:0] objectAtIndex:0] intValue]];
    
    cellsController.userInteractionEnabled = YES;
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
    
    cellsController.userInteractionEnabled = YES;
    [cellsController setOwnerSymbol:yourSymbol];
    [self unschedule:@selector(defenceAndAttackST)];
    
}

/*
 UIAlertViewDelegate methods
 */
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex] && [alertView.title isEqualToString:@"You are alone in game"]) {
        if ([appDelegate.mcManager isConnected]) {
            [appDelegate.mcManager sendToPeer:@"[anotherPlayerStatus: Quit The Game]"];
            appDelegate.mcManager.yourSymbolChoise = @"";
            appDelegate.mcManager.anotherPlayerSymbolChoise = @"";
        }
        [appDelegate.playingData saveCurrentPlayingType:@""];
        [[CCDirector sharedDirector] replaceScene:[FirstScene scene]];
    }
    
}



@end
