//
//  MCManager.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 3/16/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
//#import "cocos2d.h"
#import "AppDelegate.h"

@interface MCManager : NSObject <MCSessionDelegate, MCBrowserViewControllerDelegate, UIAlertViewDelegate> {
    NSString *kServiceType;
    UIViewController *viewController;
    AppController *appDelegate;
}

@property (nonatomic, assign) BOOL isConnectMoved;

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiserAssistant;
@property (nonatomic, strong) MCBrowserViewController *browserViewController;

-(void) recieveMessage:(NSString*) message fromPeerID:(MCPeerID *) peerID;
-(void) sendData:(NSData*) data;
-(void) setMultiPeer;
-(void) connect;
-(void) disconnect;
//-(void) selectViewController:(id) customViewController;
-(void) checkConnectionAndMovingToPlayingScene;
@end
