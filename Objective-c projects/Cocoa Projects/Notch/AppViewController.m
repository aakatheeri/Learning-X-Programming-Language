//
//  AppViewController.m
//  Notch
//
//  Created by Ahmed Alkatheeri on 9/26/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "AppViewController.h"

@interface AppViewController ()

@end

@implementation AppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        status = [[NSTextField alloc] init];
    }
    
    return self;
}

-(IBAction)changeDirection:(id)sender {
    
    NSString *direction;
    
    if ([sender tag] == 1) {
        direction = @"Top";
    } else if ([sender tag] == 2) {
        direction = @"Right";
    } else if ([sender tag] == 3) {
        direction = @"Buttom";
    } else if ([sender tag] == 4) {
        direction = @"Left";
    }
    [status setStringValue:[NSString stringWithFormat:@"Current direction is %@", direction]];
    printf("Direction changed to => %s\n", [direction UTF8String]);
}

@end
