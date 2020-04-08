//
//  AppDelegate.h
//  Notch
//
//  Created by Ahmed Alkatheeri on 9/26/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,strong) IBOutlet NSViewController *appViewController;

@end
