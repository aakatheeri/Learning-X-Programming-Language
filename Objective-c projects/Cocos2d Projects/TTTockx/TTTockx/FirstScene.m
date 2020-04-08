//
//  FirstScene.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 12/6/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "FirstScene.h"
#import "ChoosePlayTypeScene.h"

@implementation FirstScene
+(CCScene*) scene {
    FirstScene *firstScene = [FirstScene node];
    CCScene *scene = [CCScene node];
    [scene addChild:firstScene];
    return scene;
}

-(id) init {
    
    if (self=[super init]) {
        
        // Initial some variables
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
        
        // Initial the menu of playing
        CCMenuItemLabel *playItem = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"Play" fontName:@"MarkerFelt-Thin" fontSize:70] block:^(id sender) {
            
            id transition = [CCTransitionFadeUp transitionWithDuration:0.4 scene:[ChoosePlayTypeScene scene]];
            [[CCDirector sharedDirector] replaceScene:transition];
            
        }];
        playItem.color = ccc3(255, 172, 44);
        
        if(playItem.isSelected) {
            CCScaleTo *scaleToAction = [CCScaleTo actionWithDuration:0.5 scale:1.5];
            [playItem runAction:scaleToAction];
        }
        
        CCMenu *playMenu = [CCMenu menuWithItems:playItem, nil];
        playMenu.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:playMenu];
        
        // Create plist data-file if not exist
        if (![[NSFileManager defaultManager] fileExistsAtPath:[self playingDataFilePath]]) {
            [self saveDictionary:@"Playing"];
        }
        
    }
    
    return self;
}

// initial the way to save data (symbol to choose + history in future)

- (void) saveDictionary:(NSString*)type {
    if ([type isEqualToString:@"Playing"]) {
        //NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSArray arrayWithObjects:@"X", @"2013-5-20", nil], nil] forKeys:[NSArray arrayWithObjects:@"Match 1", nil]];
        NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"-", @"-", nil] forKeys:[NSArray arrayWithObjects:@"currentSymbol", @"playType", nil]];
        NSString *path = [self playingDataFilePath];
        [dic writeToFile:path atomically:YES];
    }
}

-(NSString*) getCurrentSymbolFromPlayingDataFile {
    NSDictionary *settingDictionary = [[NSDictionary alloc] initWithContentsOfFile:[self playingDataFilePath]];
    return [settingDictionary valueForKey:@"currentSymbol"];
}

-(NSString*) getPlayTypeFromPlayingDataFile {
    NSDictionary *settingDictionary = [[NSDictionary alloc] initWithContentsOfFile:[self playingDataFilePath]];
    return [settingDictionary valueForKey:@"playType"];
}

- (NSString *)playingDataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"playingData.plist"];
}

@end
