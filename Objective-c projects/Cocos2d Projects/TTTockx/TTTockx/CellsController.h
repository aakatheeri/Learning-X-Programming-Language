//
//  CellsController.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/24/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CellsController : CCLayer {
    CGSize winSize;
    int cellWidthAndHeight;
    float cellBorderWidth;
    int totalKnockedCells;

    NSMutableArray *cells;
    NSString *ownerSymbol;
    NSMutableArray *seqCellsConnection;
    NSArray *seqCellsTags;
    NSMutableArray *tagsOfWinCells;
    BOOL isGameEnd;
}

// Initial methods
-(id) initWithSymbol:(NSString*)symbol;
-(void) createCells;
-(void) seqCellsInitial;

// get/set methods
-(int) getCellWidthAndHeight;
-(float) getCellBorderWidth;
-(NSString*) setDecisionMessage;
-(NSString*) getOwnerSymbol;
-(void) setOwnerSymbol:(NSString*)symbol;
-(NSMutableArray*) getSeqConnectedCells;
-(NSArray*) getSeqTaggedCells;

// Logic methods
-(void) fillSeqSysWithSymbol:(NSString*) symbol andSelectedTag:(int)tag;
-(BOOL) isGameEnd;
-(BOOL*) checkSeqTaggedCellValueWithByCornerIndex:(int)cornerIndex withItemIndex:(int)itemIndex andSymbol:(NSString*)symbol;
-(BOOL*) checkCellValueByTag:(int)itemIndex andSymbol:(NSString*) symbol;
-(void) knockTheCellByTag:(int) index;
@end
