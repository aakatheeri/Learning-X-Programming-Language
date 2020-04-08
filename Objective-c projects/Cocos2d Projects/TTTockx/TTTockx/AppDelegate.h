//
//  AppDelegate.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/21/13.
//  Copyright Ahmed Alkatheeri 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "MCManager.h"
#import "PlayingData.h"

// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, strong) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (nonatomic, strong) MCManager *mcManager;
@property (nonatomic, strong) PlayingData *playingData;

@end
