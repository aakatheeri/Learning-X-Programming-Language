//
//  ChooseSymbolScene.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "AppDelegate.h"

@interface ChooseSymbolScene : CCScene {
    AppDelegate *appDelegate;
    
    NSString *chozenSymbol;
    NSString *currentPlayType;
    
    CCButton *xSym;
    CCButton *oSym;
    CCButton *backItem;
    
    CCLabelTTF *statusMessage;
    CCButton *startGameButton;
}
+(ChooseSymbolScene*) scene;
@end
