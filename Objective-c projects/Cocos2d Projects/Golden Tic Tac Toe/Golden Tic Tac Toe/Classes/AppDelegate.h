//
//  AppDelegate.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/18/14.
//  Copyright Ahmed Alkatheeri 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "cocos2d.h"
#import "PlayingData.h"
#import "MCManager.h"
#import "Popup.h"
@interface AppDelegate : CCAppDelegate

@property (nonatomic, strong) MCManager *mcManager;
@property (nonatomic, strong) PlayingData *playingData;
@end
