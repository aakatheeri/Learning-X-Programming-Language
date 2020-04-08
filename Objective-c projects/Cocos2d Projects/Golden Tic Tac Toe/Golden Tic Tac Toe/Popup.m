//
//  Popup.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/20/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "Popup.h"
#import "AppDelegate.h"
#import "FirstScene.h"
#import "GameScene.h"
@interface Popup() {
    AppDelegate *appDelegate;
}

@end

@implementation Popup

+(Popup*) scene {
    return [[self alloc] init];
}

-(id) initWithContentSize:(CGSize)contentSizeVar {
    self=[super init];
    if(!self) return (nil);
    
    // initial some variable
    height = contentSizeVar.height;
    width = contentSizeVar.width;
    self.contentSize = contentSizeVar;
    self.anchorPoint = ccp(0,0);
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    isSettingChanged = NO;
    _isPlayerRepeatTheGame = NO;
    
    // Initial background color
    background = [[CCNodeColor alloc] initWithColor:[CCColor blackColor] width:width height:height];
    background.opacity = 0;
    [self addChild:background z:0];
    NSLog(@"[Initializing popup]");
    
    return self;
}

-(void) setPopupType:(NSString*) popupType {
    typeOfPopup = popupType;
}

-(void) showPopupWithType:(NSString*)title {
    if (![title isEqualToString:@""]) {
        
        
         // You will add background, text, buttons here
         if ([title isEqualToString:@"information"]) {
         
             // Background Image
             CCSprite *backgroundImage = [CCSprite spriteWithImageNamed:@"about-popup-background-iphone.png"];
             backgroundImage.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
             [background addChild:backgroundImage z:1];
             
             // Continue button
             CCButton *continueButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"about-continue-button-iphone.png"]];
             continueButton.position = ccp(self.contentSize.width/2, backgroundImage.position.y - backgroundImage.contentSize.height/2 + continueButton.contentSize.height);
             [continueButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"about-continue-button-selected-iphone.png"] forState:CCControlStateHighlighted];
             [continueButton setTarget:self selector:@selector(closePopup)];
             [background addChild:continueButton z:2];
             
             // Text of information
             CCLabelTTF *aboutText = [CCLabelTTF labelWithString:@"Golden Tic Tac Toe game \n is created by Small Digits \n apps development team \n© 2012 - 2014" fontName:@"HelveticaNeue-Bold" fontSize:19]; // try to use external font
             aboutText.horizontalAlignment = CCTextAlignmentCenter;
             aboutText.color = [CCColor blackColor];
             aboutText.position = ccp(self.contentSize.width/2, continueButton.position.y + aboutText.contentSize.height - 5);
             
             [background addChild:aboutText z:2];
         
         } else if ([title isEqualToString:@"setting"]) {
         
             // Background Image
             CCSprite *backgroundImage = [CCSprite spriteWithImageNamed:@"setting-popup-background-iphone.png"];
             backgroundImage.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
             [background addChild:backgroundImage z:1];
             
             // Buttons' labels
             CCSprite *soundsTitle = [CCSprite spriteWithImageNamed:@"setting-title-sounds-iphone.png"];
             soundsTitle.position = ccp(backgroundImage.position.x - backgroundImage.contentSize.width/2 + 20, backgroundImage.position.y + backgroundImage.contentSize.height/2 - soundsTitle.contentSize.height - 30);
             soundsTitle.anchorPoint = ccp(0, 0);
             [background addChild:soundsTitle z:2];
             
             CCSprite *musicTitle = [CCSprite spriteWithImageNamed:@"setting-title-music-iphone.png"];
             musicTitle.position = ccp(soundsTitle.position.x, soundsTitle.position.y - musicTitle.contentSize.height - 50);
             musicTitle.anchorPoint = ccp(0,0);
             [background addChild:musicTitle z:2];
             
             // Buttons: for sounds
             if ([[appDelegate.playingData getStatusOfSoundsFromPlayingDataFile] isEqualToString:@"Enable"]) {
                 onSoundButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-choose-iphone.png"]];
                 offSoundButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-iphone.png"]];
             } else if ([[appDelegate.playingData getStatusOfSoundsFromPlayingDataFile] isEqualToString:@"Disable"]) {
                 onSoundButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-iphone.png"]];
                 offSoundButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-choose-iphone.png"]];
             }
             [onSoundButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-choose-selected-iphone.png"] forState:CCControlStateHighlighted];
             onSoundButton.anchorPoint = ccp(0,0);
             [onSoundButton setTarget:self selector:@selector(soundsIsEnable)];
             
             [offSoundButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-choose-selected-iphone.png"] forState:CCControlStateHighlighted];
             offSoundButton.anchorPoint = ccp(0,0);
             [offSoundButton setTarget:self selector:@selector(soundsIsDisable)];
             
             // Buttons:Boxing: for sounds
             
             CCLayoutBox *soundsButtons = [[CCLayoutBox alloc] init];
             soundsButtons.anchorPoint = ccp(0,0);
             [soundsButtons addChild:onSoundButton z:0 name:@"enableSounds"];
             [soundsButtons addChild:offSoundButton z:0 name:@"disableSounds"];
             soundsButtons.spacing = 15.f;
             soundsButtons.direction = CCLayoutBoxDirectionHorizontal;
             [soundsButtons layout];
             soundsButtons.position = ccp(soundsTitle.position.x + soundsTitle.contentSize.width + 20, soundsTitle.position.y - onSoundButton.contentSize.height/3);
             [background addChild:soundsButtons z:2];
             
             // Buttons: for music
             if ([[appDelegate.playingData getStatusOfMusicFromPlayingDataFile] isEqualToString:@"Enable"]) {
                 onMusicButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-choose-iphone.png"]];
                 offMusicButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-iphone.png"]];
             } else if ([[appDelegate.playingData getStatusOfMusicFromPlayingDataFile] isEqualToString:@"Disable"]) {
                 onMusicButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-iphone.png"]];
                 offMusicButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-choose-iphone.png"]];
             }
             [onMusicButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-choose-selected-iphone.png"] forState:CCControlStateHighlighted];
             onMusicButton.anchorPoint = ccp(0,0);
             [onMusicButton setTarget:self selector:@selector(musicIsEnable)];
             
             [offMusicButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-choose-selected-iphone.png"] forState:CCControlStateHighlighted];
             offMusicButton.anchorPoint = ccp(0,0);
             [offMusicButton setTarget:self selector:@selector(musicIsDisable)];
             
             // Buttons:Boxing: for music
             CCLayoutBox *musicButtons = [[CCLayoutBox alloc] init];
             musicButtons.anchorPoint = ccp(0,0);
             [musicButtons addChild:onMusicButton z:0 name:@"enableMusic"];
             [musicButtons addChild:offMusicButton z:0 name:@"disableMusic"];
             musicButtons.spacing = 15.f;
             musicButtons.direction = CCLayoutBoxDirectionHorizontal;
             [musicButtons layout];
             musicButtons.position = ccp(soundsButtons.position.x, musicTitle.position.y - onMusicButton.contentSize.height/3);
             [background addChild:musicButtons z:2];
             
             // Done Button
             CCButton *doneButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-done-button-iphone-hd.png"]];
             [doneButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-done-button-selected-iphone-hd.png"] forState:CCControlStateHighlighted];
             doneButton.position = ccp(self.contentSize.width/2, backgroundImage.position.y - backgroundImage.contentSize.height/2 + doneButton.contentSize.height);
             [doneButton setTarget:self selector:@selector(closePopup)];
             [background addChild:doneButton z:2];
         
         } else if ([title isEqualToString:@"menuOfGame"]) {
             
             // Menu item of game
             CCButton *quitButton = [CCButton buttonWithTitle:@"Quit" fontName:@"Helvetica-Bold" fontSize:30];
             quitButton.color = [CCColor whiteColor];
             [quitButton setTarget:self selector:@selector(quitSelector)];
             
             CCButton *repeatTheGameButton = [CCButton buttonWithTitle:@"Repeat Game" fontName:@"Helvetica-Bold" fontSize:30];
             repeatTheGameButton.color = [CCColor whiteColor];
             [repeatTheGameButton setTarget:self selector:@selector(repeatTheGameMainSelector)];
             
             CCButton *continueButton = [CCButton buttonWithTitle:@"Continue" fontName:@"Helvetica-Bold" fontSize:30];
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
             [background addChild:menu z:2];
             
         } else if ([title isEqualToString:@"achievementOfGame"]) {
             
         } else if ([title isEqualToString:@"gameResult"]) {
             
         } else if ([title isEqualToString:@"forceOfGameRepeat"]) {
             
             appDelegate.mcManager.anotherPlayerRepeatTheGame = NO;
             
             CCLabelTTF *repeatWarning = [CCLabelTTF labelWithString:@"Another player repeated \n this game, you have to \n play it again with him/her" fontName:@"Helvetica-Bold" fontSize:22];
             repeatWarning.horizontalAlignment = CCTextAlignmentCenter;
             repeatWarning.color = [CCColor whiteColor];
             repeatWarning.position = ccp(self.contentSize.width/2, (self.contentSize.height/2) + 20);
             [background addChild:repeatWarning z:2];
             
             CCButton *repeatButton = [CCButton buttonWithTitle:@"Repeat The Game" fontName:@"Helvetica-Bold" fontSize:32];
             repeatButton.position = ccp(self.contentSize.width/2, self.contentSize.height/2 - repeatWarning.contentSize.height);
             repeatButton.color = [CCColor yellowColor];
             [repeatButton setTarget:self selector:@selector(repeatTheGameSceneSelector)];
             [background addChild:repeatButton];
         }
        
        
        NSLog(@"[Showing Popup]");
        background.opacity = 1;
    }
}

-(void) closePopup {
    
    if([typeOfPopup isEqualToString:@"setting"]){
        // update playing data here
        
        // clear type of popup before closing
        typeOfPopup = nil;
    }
    
    // Remove background color
    [self removeChild:background cleanup:YES];
    
    // Initial background color
    background = [[CCNodeColor alloc] initWithColor:[CCColor blackColor] width:width height:height];
    background.opacity = 0;
    [self addChild:background z:0];
}

-(BOOL) isPopupShow {
    if (background.opacity == 1) {
        return YES;
    } else {
        return NO;
    }
}

-(void) update:(CCTime)delta {
    
    if (isSettingChanged == YES) {
        CCButton *enableSounds = (CCButton*)[self getChildByName:@"enableSounds" recursively:YES];
        CCButton *disableSounds = (CCButton*)[self getChildByName:@"disableSounds" recursively:YES];
        CCButton *enableMusic = (CCButton*)[self getChildByName:@"enableMusic" recursively:YES];
        CCButton *disableMusic = (CCButton*)[self getChildByName:@"disableMusic" recursively:YES];
        
        if ([[appDelegate.playingData getStatusOfSoundsFromPlayingDataFile] isEqualToString:@"Enable"]) {
            
            [enableSounds setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-choose-iphone.png"] forState:CCControlStateNormal];
            [disableSounds setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-iphone.png"] forState:CCControlStateNormal];
            isSettingChanged = NO;
        } else if ([[appDelegate.playingData getStatusOfSoundsFromPlayingDataFile] isEqualToString:@"Disable"]) {
            
            [enableSounds setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-iphone.png"] forState:CCControlStateNormal];
            [disableSounds setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-choose-iphone.png"] forState:CCControlStateNormal];
            isSettingChanged = NO;
        }
        
        if ([[appDelegate.playingData getStatusOfMusicFromPlayingDataFile] isEqualToString:@"Enable"]) {
            
            [enableMusic setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-choose-iphone.png"] forState:CCControlStateNormal];
            [disableMusic setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-iphone.png"] forState:CCControlStateNormal];
            isSettingChanged = NO;
        } else if ([[appDelegate.playingData getStatusOfMusicFromPlayingDataFile] isEqualToString:@"Disable"]) {
            
            [enableMusic setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-on-button-iphone.png"] forState:CCControlStateNormal];
            [disableMusic setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-off-button-choose-iphone.png"] forState:CCControlStateNormal];
            isSettingChanged = NO;
        }
    }
    
}

/*
    setting selectors
*/

-(void) soundsIsEnable {
    [appDelegate.playingData setSoundsStatus:@"Enable"];
    isSettingChanged = YES;
}

-(void) soundsIsDisable {
    [appDelegate.playingData setSoundsStatus:@"Disable"];
    isSettingChanged = YES;
}

-(void) musicIsEnable {
    [appDelegate.playingData setMusicStatus:@"Enable"];
    isSettingChanged = YES;
}

-(void) musicIsDisable {
    [appDelegate.playingData setMusicStatus:@"Disable"];
    isSettingChanged = YES;
}

-(void) quitSelector {
    [[CCDirector sharedDirector] replaceScene:[FirstScene scene]];
}

-(void) repeatTheGameMainSelector {
    _isPlayerRepeatTheGame = YES;
    if ([appDelegate.mcManager isConnected] && [[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
        [appDelegate.mcManager sendToPeer:@"[anotherPlayerStatus: Repeat The Game]"];
    }
    [self repeatTheGameSceneSelector];
}

-(void) repeatTheGameSceneSelector {
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}

-(void) continueSelector {
    [self closePopup];
}

@end
