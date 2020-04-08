//
//  Popup.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/20/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"

@interface Popup : CCNode {
    
    NSString *typeOfPopup;
    CCNodeColor *background;
    int width;
    int height;
    BOOL isSettingChanged;
    
    CCButton *onSoundButton;
    CCButton *offSoundButton;
    CCButton *onMusicButton;
    CCButton *offMusicButton;
}
//@property (nonatomic, strong) CCNodeColor *background;
@property (nonatomic, assign) BOOL isPlayerRepeatTheGame;
-(id) initWithContentSize:(CGSize)contentSizeVar;
-(void) setPopupType:(NSString*) popupType;
+(Popup*) scene;
-(void) showPopupWithType:(NSString*)title;
-(BOOL) isPopupShow;
@end
