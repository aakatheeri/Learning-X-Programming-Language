//
//  FirstScene.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/18/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "FirstScene.h"
#import "ChoosePlayTypeScene.h"

@implementation FirstScene
+(FirstScene*) scene {
    return [[self alloc] init];
}

-(id) init {
    
    self = [super init];
    if(!self) return (nil);
    
    // Initial background
    CCNodeColor *backgroundColor = [[CCNodeColor alloc] initWithColor:[CCColor colorWithCcColor3b:ccc3(255, 243, 193)]];
    backgroundColor.contentSize = self.contentSize;
    backgroundColor.position = ccp(0, 0);
    [self addChild:backgroundColor z:0];
    
    CCSprite *background = [CCSprite spriteWithImageNamed:@"background-iphone.png"]; // Background header
    background.position = ccp(self.contentSize.width/2, self.contentSize.height - background.contentSize.height/2);
    [self addChild:background z:1];
    
    // Play button
    playButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"play-button-iphone.png"]];
    playButton.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    [playButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"play-button-selected-iphone.png"] forState:CCControlStateHighlighted];
    [playButton setTarget:self selector:@selector(playGame)];
    [self addChild:playButton z:2];
    
    
    // Other small button
    informationButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"information-icon-firstScene-iphone.png"]];
    [informationButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"information-icon-firstScene-selected-iphone.png"] forState:CCControlStateHighlighted];
    [informationButton setTarget:self selector:@selector(showInformationSelector)];
    settingButton = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-icon-firstScene-iphone.png"]];
    [settingButton setBackgroundSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"setting-icon-firstScene-selected-iphone.png"] forState:CCControlStateHighlighted];
    [settingButton setTarget:self selector:@selector(showSettingSelector)];
    
    CCLayoutBox *smallButtons = [[CCLayoutBox alloc] init];
    smallButtons.anchorPoint = ccp(0.5,0.5);
    [smallButtons addChild:informationButton];
    [smallButtons addChild:settingButton];
    smallButtons.spacing = 15.f;
    smallButtons.direction = CCLayoutBoxDirectionHorizontal;
    [smallButtons layout];
    smallButtons.position = ccp(self.contentSize.width/2, informationButton.contentSize.height);
    [self addChild:smallButtons z:2];
    
    // Initial popup
    popup = [[Popup alloc] initWithContentSize:self.contentSize];
    popup.position = ccp(0, 0);
    [self addChild:popup z:5];
    return self;
}

-(void) showInformationSelector {
    [popup showPopupWithType:@"information"];
    
}

-(void) showSettingSelector {
    [popup setPopupType:@"setting"];
    [popup showPopupWithType:@"setting"];
}

-(void) playGame {
    [[CCDirector sharedDirector] replaceScene:[ChoosePlayTypeScene scene]];
}

-(void) update:(CCTime)delta {
    if ([popup isPopupShow] == YES) {
        playButton.enabled = NO;
        informationButton.enabled = NO;
        settingButton.enabled = NO;
    } else {
        playButton.enabled = YES;
        informationButton.enabled = YES;
        settingButton.enabled = YES;
    }
}

@end
