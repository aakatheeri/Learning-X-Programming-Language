//
//  MCManager.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//


#import "MCManager.h"
#import "AppDelegate.h"
#import "cocos2d.h"
#import "ChooseSymbolScene.h"
#import "ConnectWithPeer.h"

@interface MCManager() {
    AppDelegate *appDelegate;
}

@end
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
        appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        
        // Set up main view controller for cocos2d
        viewController = [[appDelegate window] rootViewController];
        
        // Set up default boolean connection variable
        _isConnectMoved = NO;
        _isPeerGreaterThanRequired = NO;
        
        // Set up multipeer connectivity components
        [self setMultiPeer];
        
        // Schedule connection checking method
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkConnectionAndMovingToPlayingScene) userInfo:nil repeats:YES];
        
        // Set other properties
        _yourSymbolChoise = @"";
        _anotherPlayerSymbolChoise = @"";
        _shouldIStartFirst = nil;
        _anotherPlayerGameStatus = @"";
        _anotherPlayerRepeatTheGame = NO;
    }
    
    return self;
}

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

-(BOOL) isConnected {
    if ([self.session.connectedPeers count] > 0) {
        return YES;
    } else {
        return NO;
    }
}

-(void) checkConnectionAndMovingToPlayingScene {
    
    if ([self isConnected] && _isConnectMoved == NO && viewController.presentedViewController == nil && [[_session connectedPeers] count] < 3) {
        
        if (![[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
            [appDelegate.playingData saveCurrentPlayingType:@"Multipeer"];
        }
        NSLog(@"[Current playing type is \"%@\"]", [appDelegate.playingData getPlayTypeFromPlayingDataFile]);
        
        UIAlertView *moveAlert = [[UIAlertView alloc] initWithTitle:@"You will be moved to another scene!" message:@"Now you are conenct with one peer at least in your session, next you will be moved to correct scene" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [moveAlert show];
        
        _isPeerGreaterThanRequired = NO;
        _isConnectMoved = YES;
        NSLog(@"[You are connected with %lu peer]", (unsigned long)[self.session.connectedPeers count]);
        
        // Close advertising
        [_advertiserAssistant stop];
        
    } else if ([self isConnected] && _isPeerGreaterThanRequired == NO && viewController.presentedViewController == nil && [[_session connectedPeers] count] > 2) {
        
        // Close advertising
        [_advertiserAssistant stop];
        
        _isPeerGreaterThanRequired = YES;
        UIAlertView *moveAlert = [[UIAlertView alloc] initWithTitle:@"You have to play with one peer" message:@"This game required to play with one peer only and you selected one than one peer, try to connect again with one peer" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [moveAlert show];
        
    } else if (![self isConnected] && _isConnectMoved == YES && [[appDelegate.playingData getPlayTypeFromPlayingDataFile] isEqualToString:@"Multipeer"]) {
        
        UIAlertView *lostAlert = [[UIAlertView alloc] initWithTitle:@"The Connection is lost" message:@"Connect with your partner peer again to play the game!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [lostAlert show];
        
        _isPeerGreaterThanRequired = NO;
        _isConnectMoved = NO;
        NSLog(@"[Current peers are %lu]", (unsigned long)[self.session.connectedPeers count]);
        
        // Start advertising
        [_advertiserAssistant start];
    }
    
    
    // Clear your/anotherPlayer symbols if connection is fail
    
}

-(BOOL) isSymbolsChosedSuccessful {
    
    if(![self.anotherPlayerSymbolChoise isEqualToString:self.yourSymbolChoise]) {
        
        if (([self.anotherPlayerSymbolChoise isEqualToString:@"[X]"] || [self.anotherPlayerSymbolChoise isEqualToString:@"[O]"]) && ([self.yourSymbolChoise isEqualToString:@"[X]"] || [self.yourSymbolChoise isEqualToString:@"[O]"])) {
            return YES;
        }
    }
    
    return NO;
}

-(void) recieveMessage:(NSString*) message fromPeerID:(MCPeerID *) peerID {
    
}

-(void) sendToPeer:(NSString*)msg  {
    
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    [self.session sendData:data toPeers:self.session.connectedPeers withMode:MCSessionSendDataUnreliable error:&error];
    NSLog(@"[Data is send => (%@)]", msg);
}

-(BOOL) isThereAnyRecievingSymbolAndCellTag {
    if ((int)[_temporaryGivenCellTagFromPeer length] !=0 && (int)[_temporaryGivenSymbolFromPeer length] != 0) {
        return YES;
    }
    return NO;
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
    
    //  Decode data back to NSString
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // Set another peer symbol
    if ([message isEqualToString:@"[X]"] || [message isEqualToString:@"[O]"]) {
        //dispatch_async(dispatch_get_main_queue(), ^{
        
        self.anotherPlayerSymbolChoise = message;
        NSLog(@"[Recieving a data]");
        //});
        
        // For Knowing who will start game first
    } else if ([message isEqualToString:@"NO"]) {
        _shouldIStartFirst = NO;
        
        // For playing game
    } else if ([message isEqualToString:@"[anotherPlayerStatus: In The Game]"]) {
        _anotherPlayerGameStatus = @"In The Game";
    } else if ([message isEqualToString:@"[anotherPlayerStatus: Will Play The Game]"]) {
        _anotherPlayerGameStatus = @"Will Play The Game";
    } else if ([message isEqualToString:@"[anotherPlayerStatus: Quit The Game]"]) {
        _anotherPlayerGameStatus = @"Quit The Game";
    } else if ([message isEqualToString:@"[anotherPlayerStatus: Repeat The Game]"]) {
        _anotherPlayerRepeatTheGame = YES;
    } else {
        
        if ([message length] == 5) {
            NSArray *temporarySeparation = [message componentsSeparatedByString:@":"];
            _temporaryGivenSymbolFromPeer = temporarySeparation[0];
            _temporaryGivenCellTagFromPeer = temporarySeparation[1];
        }
        
    }
    
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
        [[CCDirector sharedDirector] replaceScene:[ChooseSymbolScene scene]];
        NSLog(@"[Move to \"ChooseSymbolScene\" directly!]");
    }
    
    if (buttonIndex == [alertView cancelButtonIndex] && [alertView.title isEqualToString:@"The Connection is lost"]) {
        _yourSymbolChoise = @"";
        _anotherPlayerSymbolChoise = @"";
        [[CCDirector sharedDirector] replaceScene:[ConnectWithPeer scene]];
        NSLog(@"[Move to \"ConnectWithPeer\" directly!]");
    }
    
    if (buttonIndex == [alertView cancelButtonIndex] && [alertView.title isEqualToString:@"You have to play with one peer"]) {
        [_session disconnect];
        
        // Start advertising
        [_advertiserAssistant start];
    }
}

@end

