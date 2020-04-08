//
//  MCManager.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>
//#import "AppDelegate.h"

@interface MCManager : NSObject <MCSessionDelegate, MCBrowserViewControllerDelegate, UIAlertViewDelegate> {
    NSString *kServiceType;
    UIViewController *viewController;
    //AppDelegate *appDelegate;
}

@property (nonatomic, assign) BOOL isConnectMoved;
@property (nonatomic, assign) BOOL isPeerGreaterThanRequired;

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiserAssistant;
@property (nonatomic, strong) MCBrowserViewController *browserViewController;

// Sharable game properties
@property (nonatomic, strong) NSString *yourSymbolChoise;
@property (nonatomic, strong) NSString *anotherPlayerSymbolChoise;
@property (nonatomic, strong) NSString *temporaryGivenSymbolFromPeer;
@property (nonatomic, strong) NSString *temporaryGivenCellTagFromPeer;
@property (nonatomic, assign) BOOL shouldIStartFirst;
@property (nonatomic, assign) NSString *anotherPlayerGameStatus;
@property (nonatomic, assign) BOOL *anotherPlayerRepeatTheGame;


-(void) recieveMessage:(NSString*) message fromPeerID:(MCPeerID *) peerID;
//-(void) sendData:(NSData*) data;
-(void) sendToPeer:(NSString*)msg;
-(void) setMultiPeer;
-(void) connect;
-(void) disconnect;
-(BOOL) isConnected;
-(BOOL) isSymbolsChosedSuccessful;
-(void) checkConnectionAndMovingToPlayingScene;
-(BOOL) isThereAnyRecievingSymbolAndCellTag;
@end
