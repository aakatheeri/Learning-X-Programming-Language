//
//  AppDelegate.h
//  Rawne
//
//  Created by Ahmed Alkatheeri on 10/9/13.
//  Copyright Ahmed Alkatheeri 2013. All rights reserved.
//

#import <UIKit/UIKit.h>


// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) MyNavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
