//
//  MidSickAppController.h
//  MidSick
//
//  Created by Ahmed Alkatheeri on 2/7/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//

@class RootViewController;

@interface AppController : NSObject <UIAccelerometerDelegate, UIAlertViewDelegate, UITextFieldDelegate,UIApplicationDelegate> {
    UIWindow *window;
    RootViewController	*viewController;
}

@end

