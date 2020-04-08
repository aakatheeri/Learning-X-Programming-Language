//
//  CellContainer.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/23/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Cell : CCLayerColor {
    NSString *owner;
    int knockState;
    CCLabelTTF *ownerOnBoard;
}
-(id) initWithColor:(ccColor4B)color width:(GLfloat)w height:(GLfloat)h;
-(void) initial;
-(void) updateBoard;
-(BOOL) isKnocked;
-(void) setOwner:(NSString*) ownerName;
-(NSString*) getOwner;
-(void) setKnockState:(int) state;
-(CCLabelTTF*) getOwnerOnBoard;
@end
