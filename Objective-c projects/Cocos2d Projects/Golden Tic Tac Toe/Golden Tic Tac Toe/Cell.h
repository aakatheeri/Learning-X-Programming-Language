//
//  Cell.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Cell : CCNodeColor {
    NSString *owner;
    int knockState;
    CCLabelTTF *ownerOnBoard;
}
-(id) initWithColor:(CCColor*)color width:(GLfloat)w height:(GLfloat)h;
-(void) initial;
-(void) updateBoard;
-(BOOL) isKnocked;
-(void) setOwner:(NSString*) ownerName;
-(NSString*) getOwner;
-(void) setKnockState:(int) state;
-(CCLabelTTF*) getOwnerOnBoard;
@end
