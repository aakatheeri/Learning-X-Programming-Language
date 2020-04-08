//
//  ChooseSymbolScene.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 12/11/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChooseSymbolScene : CCLayer {
    NSString *chozenSymbol;
    NSString *currentPlayType;
    
    CCMenuItemLabel *xSym;
    CCMenuItemLabel *oSym;
    CCMenuItemLabel *backItem;
}
+(CCScene*) scene;
@end
