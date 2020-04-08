//
//  FirstScene.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/18/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Popup.h"

@interface FirstScene : CCScene {
    Popup *popup;
    
    CCButton *playButton;
    CCButton *informationButton;
    CCButton *settingButton;
}
+(FirstScene*) scene;
@end
