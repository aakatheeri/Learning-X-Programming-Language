//
//  ConnectWithPeer.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "AppDelegate.h"

@interface ConnectWithPeer : CCScene {
    CCLabelTTF *statusMessage;
    AppDelegate *appDelegate;
    CGSize winSize;
    CCButton *connectButton;
    CCButton *disconnectButton;
    CCButton *playMultipeerGame;
}
+(ConnectWithPeer*) scene;
@end
