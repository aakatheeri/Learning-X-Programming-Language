//
//  AppDelegate.m
//  Notch
//
//  Created by Ahmed Alkatheeri on 9/26/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.appViewController = [[NSViewController alloc] initWithNibName:@"AppViewController" bundle:nil];
    
    [self.window.contentView addSubview:self.appViewController.view];
    self.appViewController.view.frame = ((NSView*) self.window.contentView).bounds;
    
}

@end
