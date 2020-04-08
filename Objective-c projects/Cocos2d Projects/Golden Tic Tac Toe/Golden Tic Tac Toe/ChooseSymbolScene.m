//
//  ChooseSymbolScene.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "ChooseSymbolScene.h"
#import "ChoosePlayTypeScene.h"
#import "GameScene.h"
#import "ConnectWithPeer.h"

@implementation ChooseSymbolScene

+(ChooseSymbolScene*) scene {
    return [[super alloc] init];
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
    
    // Choose symbol type title
    CCSprite *choosePlayType = [CCSprite spriteWithImageNamed:@"title-choose-your-symbol-to-play-with-iphone.png"];
    choosePlayType.position = ccp(self.contentSize.width/2, 664/2);
    [self addChild:choosePlayType z:2];
    
    // Choose symbols
    xSym = [CCButton buttonWithTitle:@"X" fontName:@"GillSans-Bold" fontSize:60];
    xSym.color = [CCColor colorWithCcColor3b:ccc3(211, 182, 140)];
    [xSym setLabelColor:[CCColor colorWithCcColor3b:ccc3(181, 106, 0)] forState:CCControlStateHighlighted];
    
    oSym = [CCButton buttonWithTitle:@"O" fontName:@"GillSans-Bold" fontSize:60];
    oSym.color = [CCColor colorWithCcColor3b:ccc3(211, 182, 140)];
    [oSym setLabelColor:[CCColor colorWithCcColor3b:ccc3(181, 106, 0)] forState:CCControlStateHighlighted];
    
    
    if([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"] && [appDelegate.mcManager isConnected]) {
        [xSym setTarget:self selector:@selector(chooseXSymbolToMultipeer)];
        [oSym setTarget:self selector:@selector(chooseOSymbolToMultipeer)];
    } else {
        [xSym setTarget:self selector:@selector(chooseXSymbol)];
        [oSym setTarget:self selector:@selector(chooseOSymbol)];
    }
    
    
    CCLayoutBox *symbols = [[CCLayoutBox alloc] init];
    symbols.anchorPoint = ccp(0.5, 0.5);
    [symbols addChild:xSym z:0 name:@"xSym"];
    [symbols addChild:oSym z:0 name:@"oSym"];
    symbols.spacing = 40.f;
    symbols.direction = CCLayoutBoxDirectionHorizontal;
    [symbols layout];
    symbols.position = ccp(self.contentSize.width/2, self.contentSize.height/2 - symbols.contentSize.height);
    [self addChild:symbols z:1];
    
    // Back button
    CCButton *backButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"back-button-iphone.png"]];
    [backButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"back-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [backButton setTarget:self selector:@selector(backSelector)];
    backButton.anchorPoint = ccp(0,0);
    backButton.position = ccp(0, 10);
    [self addChild:backButton z:2];
    
    // Schedule choosing difference symbols successful method
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkMCChoosingSymbolsDone) userInfo:nil repeats:YES];
    
    return self;
}

-(void) update:(CCTime)delta {
//    CCButton *xButton = (CCButton*)[self getChildByName:@"xSym" recursively:YES];
//    CCButton *oButton = (CCButton*)[self getChildByName:@"oSym" recursively:YES];
//    if (xButton.selected == true) {
//        xButton.scale = 1;
//        NSLog(@"Selected");
//    }
//    
//    if (oButton.selected == true) {
//        oButton.scale = 1;
//    }
}

-(void) chooseXSymbol {
    [appDelegate.playingData saveCurrentSymbol:@"X"];
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}
-(void) chooseOSymbol {
    [appDelegate.playingData saveCurrentSymbol:@"O"];
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}

-(void) chooseXSymbolToMultipeer {
    if ([appDelegate.mcManager isConnected]) {
        
        if ([appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@""] || ![appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@"[X]"]) {
            appDelegate.mcManager.yourSymbolChoise = @"[X]";
            [appDelegate.mcManager sendToPeer:@"[X]"];
            NSLog(@"[You choose %@ symbol]", appDelegate.mcManager.yourSymbolChoise);
        } else if ([appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@"[X]"]) {
            UIAlertView *warningAlertToChooseAnotherSymbol = [[UIAlertView alloc] initWithTitle:@"Choose another symbol" message:@"Another player choose [X] symbol, choose another one." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlertToChooseAnotherSymbol show];
        }
    } else {
        UIAlertView *disconnectAlert = [[UIAlertView alloc] initWithTitle:@"Connection is failed!" message:@"Your connection with another player is failed, try to connect again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [disconnectAlert show];
    }
}
-(void) chooseOSymbolToMultipeer {
    if ([appDelegate.mcManager isConnected]) {
        
        if ([appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@""] || ![appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@"[O]"]) {
            appDelegate.mcManager.yourSymbolChoise = @"[O]";
            [appDelegate.mcManager sendToPeer:@"[O]"];
            NSLog(@"[You choose %@ symbol]", appDelegate.mcManager.yourSymbolChoise);
        } else if ([appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@"[O]"]) {
            UIAlertView *warningAlertToChooseAnotherSymbol = [[UIAlertView alloc] initWithTitle:@"Choose another symbol" message:@"Another player choose [O] symbol, choose another one." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlertToChooseAnotherSymbol show];
        }
    } else {
        UIAlertView *disconnectAlert = [[UIAlertView alloc] initWithTitle:@"Connection is failed!" message:@"Your connection with another player is failed, try to connect again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [disconnectAlert show];
    }
}

-(void) checkMCChoosingSymbolsDone {
    
    if ([appDelegate.mcManager isConnected]) {
        
        // Display waiting message + Start game button
        if (![appDelegate.mcManager.yourSymbolChoise isEqualToString:@""] && [appDelegate.mcManager.anotherPlayerSymbolChoise isEqualToString:@""]) {
            
            if (statusMessage == nil) {
                statusMessage = [CCLabelTTF labelWithString:@".. Waiting for another player .."  fontName:@"AvenirNextCondensed-Bold" fontSize:18];
                statusMessage.position = ccp(self.contentSize.width/2, self.contentSize.height/2 - 160);
                statusMessage.color = [CCColor colorWithCcColor3b:ccc3(148, 52, 5)];
                [self addChild:statusMessage z:1 name:@"status"];
            }
            
            if (appDelegate.mcManager.shouldIStartFirst == nil) {
                appDelegate.mcManager.shouldIStartFirst = YES;
                [appDelegate.mcManager sendToPeer:@"NO"];
            }
            
        } else if ([appDelegate.mcManager isSymbolsChosedSuccessful]) {
            if (startGameButton == nil) {
                
                if (statusMessage != nil) {
                    [self removeChildByName:@"status" cleanup:YES];
                    statusMessage = nil;
                }
                
                [appDelegate.mcManager sendToPeer:@"[anotherPlayerStatus: Will Play The Game]"];
                
                startGameButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-sym-start-game-iphone.png"]];
                [startGameButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"p2p-sym-start-game-selected-iphone.png"] forState:CCControlStateHighlighted];
                startGameButton.position = ccp(self.contentSize.width/2, self.contentSize.height/2 - 160);
                [startGameButton setTarget:self selector:@selector(startGameSelector)];
                [self addChild:startGameButton z:1 name:@"start-game"];
                
            }
            
        }
        
        // Alert about another peer choice
        
    }
    
}

-(void) startGameSelector {
    [appDelegate.mcManager sendToPeer:@"[I start the game]"];
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}

-(void) backSelector {
    //id transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0];
    if([[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"] && [appDelegate.mcManager isConnected]) {
        [[CCDirector sharedDirector] replaceScene:[ConnectWithPeer scene]];
    } else {
        [[CCDirector sharedDirector] replaceScene:[ChoosePlayTypeScene scene]];
    }
    
}

@end
