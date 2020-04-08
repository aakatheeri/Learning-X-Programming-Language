//
//  Cell.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "Cell.h"

@implementation Cell

/*
 Initial methods
 */
-(id) initWithColor:(CCColor*)color width:(GLfloat)w height:(GLfloat)h {
    return [super initWithColor:color width:w height:h];
}

-(void) initial {
    ownerOnBoard = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:70];
    ownerOnBoard.color = [CCColor blackColor];
    ownerOnBoard.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
    [self addChild:ownerOnBoard];
}


/*
 Get/Set methods
 */
-(CCLabelTTF*) getOwnerOnBoard {
    return ownerOnBoard;
}
-(void) setKnockState:(int) state {
    knockState = state;
}
-(void) setOwner:(NSString*) ownerName {
    owner = ownerName;
}
-(NSString*) getOwner {
    return owner;
}

/**
 Logical methods
 **/
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
-(BOOL) isKnocked {
    if (knockState == 0) {
        return NO;
    } else {
        return YES;
    }
}
@end
