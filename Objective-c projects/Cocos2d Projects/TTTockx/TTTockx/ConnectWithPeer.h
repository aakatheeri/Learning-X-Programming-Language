//
//  ConnectWithPeer.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 3/16/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AppDelegate.h"
//@class AppDelegate;

@interface ConnectWithPeer : CCNode {
    CCLabelTTF *statusMessage;
    AppController *appDelegate;
    CGSize winSize;
    CCMenuItemLabel *connectButtonItem;
}
+(CCScene*) scene;
@end
