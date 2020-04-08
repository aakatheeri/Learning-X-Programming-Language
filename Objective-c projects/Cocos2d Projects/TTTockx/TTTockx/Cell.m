//
//  CellContainer.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/23/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "Cell.h"


@implementation Cell

-(id) initWithColor:(ccColor4B)color width:(GLfloat)w height:(GLfloat)h {
    return [super initWithColor:color width:w height:h];
}

-(void) initial {
    //[self scheduleUpdate];
    ownerOnBoard = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:70];
    ownerOnBoard.color = ccc3(0, 0, 0);
    ownerOnBoard.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    [self addChild:ownerOnBoard];
}

-(void) updateBoard {
    
    if ([self isKnocked] && [ownerOnBoard.string length] == 0) {
        
        if([owner isEqualToString:@"O"] || [owner isEqualToString:@"X"]) {
            [ownerOnBoard setString:owner];
            NSLog(@"Creating (%@) Symbol .. \n", owner);
        }
        NSLog(@"Adding new symbol to cell => [%@] \n", owner);
        //[self addChild:ownerOnBoard];
    }
    
}

-(CCLabelTTF*) getOwnerOnBoard {
    return ownerOnBoard;
}

/**
 Knocking issues
 **/
-(BOOL) isKnocked {
    
    if (knockState == 0) {
        return NO;
    } else {
        return YES;
    }
}

-(void) setKnockState:(int) state {
    knockState = state;
}

/**
    Ownership
  **/
-(void) setOwner:(NSString*) ownerName {
    owner = ownerName;
}

-(NSString*) getOwner {
    return owner;
}

@end
