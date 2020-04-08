//
//  AppViewController.h
//  Notch
//
//  Created by Ahmed Alkatheeri on 9/26/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppViewController : NSViewController {
    IBOutlet NSTextField *status;
}

-(IBAction)changeDirection:(id)sender;
@end
