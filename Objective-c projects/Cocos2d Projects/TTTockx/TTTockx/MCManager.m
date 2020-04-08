//
//  MCManager.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 3/16/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "MCManager.h"
#import "GameLayer.h"

@implementation MCManager

/*
 
    Setup methods
 
*/

-(id) init {
    self=[super init];
    if (self) {
        
        // Set up service type
        kServiceType = @"t-game";
        
        // Set up AppDelegate instance variable
        appDelegate = (AppController*)[[UIApplication sharedApplication] delegate];
        
        // Set up main view controller for cocos2d
        viewController = [[appDelegate window] rootViewController];
        
        // Set up default boolean connection variable
        _isConnectMoved = NO;
        
        // Set up multipeer connectivity components
        [self setMultiPeer];
        
        // Schedule connection checking method
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkConnectionAndMovingToPlayingScene) userInfo:nil repeats:YES];
        
    }
    
    return self;
}

//-(void) selectViewController:(id) customViewController {
//    viewController = customViewController;
//}


/*
 
    Multipeer Connectivity methods
 
*/

-(void) setMultiPeer {
    
    // Setup peerID
    self.peerID = [[MCPeerID alloc] initWithDisplayName:[UIDevice currentDevice].name];
    
    // Setup session
    self.session = [[MCSession alloc] initWithPeer:self.peerID];
    self.session.delegate = self;
    
    // Setup browserViewController
    self.browserViewController = [[MCBrowserViewController alloc] initWithServiceType:kServiceType session:self.session];
    self.browserViewController.delegate = self;
    
    // Setup advertiser
    self.advertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:kServiceType discoveryInfo:nil session:self.session];
    
    // Start advertiser
    [self.advertiserAssistant start];
    NSLog(@"[Start Advertising]");
    
}

-(void) connect {
    [viewController presentViewController:self.browserViewController animated:YES completion:nil];
}

-(void) disconnect {
    [self.session disconnect];
}

-(void) checkConnectionAndMovingToPlayingScene {

    if ([self.session.connectedPeers count] > 0 && _isConnectMoved == NO && viewController.presentedViewController == nil) {
        
        UIAlertView *moveAlert = [[UIAlertView alloc] initWithTitle:@"You will be moved to another scene!" message:@"Now you are conenct with one peer at least in your session, next you will be moved to correct scene" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [moveAlert show];
        
        _isConnectMoved = YES;
        NSLog(@"[You are connected with %i peer]", [self.session.connectedPeers count]);
    } else if ([self.session.connectedPeers count] == 0 && _isConnectMoved == YES) {
        
        UIAlertView *lostAlert = [[UIAlertView alloc] initWithTitle:@"Your Connection is lost" message:@"Connect with your partner peer again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [lostAlert show];
        
        _isConnectMoved = NO;
        NSLog(@"[Current peers are %i]", [self.session.connectedPeers count]);
    }
}

-(void) recieveMessage:(NSString*) message fromPeerID:(MCPeerID *) peerID {
    
}

-(void) sendData:(NSData*) data {
    
}

/*
 
    MCBrowserViewControllerDelegate methods
 
*/
-(void) browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

/*
 
    MCSessionDelegate methods
 
*/

// Remote peer changed state
-(void) session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    
}

// Received data from remote peer
-(void) session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    
}

// Received a byte stream from remote peer
-(void) session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
}

// Start receiving a resource from remote peer
-(void) session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    
}

// Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
-(void) session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    
}

/*
 UIAlertViewDelegate methods
 */
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == [alertView cancelButtonIndex] && [alertView.title isEqualToString:@"You will be moved to another scene!"]) {
        
        // Set up playing type and symbol
//        if (another peer) {
//            [appDelegate.playingData saveCurrentSymbol:@"O"];
//        } else {
//            [appDelegate.playingData saveCurrentSymbol:@"X"];
//        }
        [appDelegate.playingData saveCurrentPlayingType:@"Multipeer"];
        NSLog(@"[Current playing type is \"%@\"]", [appDelegate.playingData getPlayTypeFromPlayingDataFile]);
        
        // Move to game scene
        [[CCDirector sharedDirector] replaceScene:[CCTransitionRotoZoom transitionWithDuration:0.5 scene:[GameLayer scene]]];
        NSLog(@"[Move to scene directly!]");
    }
}




@end
