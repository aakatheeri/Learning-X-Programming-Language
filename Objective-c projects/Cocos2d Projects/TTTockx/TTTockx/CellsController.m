//
//  CellsController.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 10/24/13.
//  Copyright 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "CellsController.h"
#import "Cell.h"

@implementation CellsController

/*
    Initial methods
*/
-(id) initWithSymbol:(NSString*)symbol {
    
    if(self=[super init]) {

        // initial some variables
        ownerSymbol = symbol;
        winSize = [[CCDirector sharedDirector] winSize];
        cellBorderWidth = 4.9;
        cellWidthAndHeight = 103;
        self.touchEnabled = YES;
        [self setContentSize:CGSizeMake(winSize.width, (cellWidthAndHeight * 3) + (cellBorderWidth * 2))];
        cells = [[NSMutableArray alloc] initWithCapacity:9];
        tagsOfWinCells = [[NSMutableArray alloc] init];
        [self seqCellsInitial];
        [self scheduleUpdate];
        totalKnockedCells = 0;
        isGameEnd = NO;
    }
    
    return self;
}

-(void) seqCellsInitial {
    
    // Cells Connection
    seqCellsConnection = [[NSMutableArray alloc] initWithCapacity:8];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:0];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:1];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:2];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:3];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:4];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:5];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:6];
    [seqCellsConnection insertObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil] atIndex:7];
    
    // Cells tags structure
    seqCellsTags = [[NSArray alloc] initWithObjects:
                    [NSArray arrayWithObjects:@"101",@"105",@"109", nil],
                    [NSArray arrayWithObjects:@"101",@"102",@"103", nil],
                    [NSArray arrayWithObjects:@"101",@"104",@"107", nil],
                    [NSArray arrayWithObjects:@"102",@"105",@"108", nil],
                    [NSArray arrayWithObjects:@"103",@"105",@"107", nil],
                    [NSArray arrayWithObjects:@"104",@"105",@"106", nil],
                    [NSArray arrayWithObjects:@"107",@"108",@"109", nil],
                    [NSArray arrayWithObjects:@"103",@"106",@"109", nil]
                    , nil];
    
}

-(void) createCells {
    
    // Create cells of game
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            Cell *cell = [[Cell alloc] initWithColor:ccc4(255, 255, 255, 255) width:cellWidthAndHeight height:cellWidthAndHeight];
            cell.anchorPoint = ccp(0.0f, 0.0f);
            cell.position = ccp((cellWidthAndHeight*i) + (cellBorderWidth*i), (cellWidthAndHeight*j) + (cellBorderWidth*j));
            [cells addObject:cell];
            [cell initial];
            [self addChild:cell z:0 tag:100 + [cells count]];

            NSLog(@"Creating cell of tag number %i, x:%f y:%f ", 100 + [cells count], cell.position.x, cell.position.y);
            
        }
    }
    
}

/*
    Get/Set methods
*/

-(int) getCellWidthAndHeight {
    return cellWidthAndHeight;
}

-(float) getCellBorderWidth {
    return cellBorderWidth;
}

-(NSString*) setDecisionMessage {
    
    // give a message
    NSMutableString *msg = [[NSMutableString alloc] initWithString:@""];
    
    if (isGameEnd == YES && [tagsOfWinCells count] == 3) {
        NSLog(@"The game is end with/without winner \n");
        
        id fadeOutAction1 = [CCFadeOut actionWithDuration:0.4],
        fadeOutAction2 = [CCFadeOut actionWithDuration:0.4],
        fadeOutAction3 = [CCFadeOut actionWithDuration:0.4];
        
        id fadeInAction1 = [CCFadeIn actionWithDuration:0.4],
        fadeInAction2 = [CCFadeIn actionWithDuration:0.4],
        fadeInAction3 = [CCFadeIn actionWithDuration:0.4];
        
        CCSequence *seqAction1 = [CCSequence actions:fadeOutAction1, fadeInAction1, nil],
        *seqAction2 = [CCSequence actions:fadeOutAction2, fadeInAction2, nil],
        *seqAction3 = [CCSequence actions:fadeOutAction3, fadeInAction3, nil];
        
        // Add actions to seq cells
        Cell *cell1 = (Cell*)[self getChildByTag:[[tagsOfWinCells objectAtIndex:0] intValue]];
        Cell *cell2 = (Cell*)[self getChildByTag:[[tagsOfWinCells objectAtIndex:1] intValue]];
        Cell *cell3 = (Cell*)[self getChildByTag:[[tagsOfWinCells objectAtIndex:2] intValue]];
        
        CCLabelTTF *ownerOnBoardOfCell1 = [cell1 getOwnerOnBoard];
        CCLabelTTF *ownerOnBoardOfCell2 = [cell2 getOwnerOnBoard];
        CCLabelTTF *ownerOnBoardOfCell3 = [cell3 getOwnerOnBoard];
        [ownerOnBoardOfCell1 runAction:[CCRepeat actionWithAction:seqAction1 times:3]];
        [ownerOnBoardOfCell2 runAction:[CCRepeat actionWithAction:seqAction2 times:3]];
        [ownerOnBoardOfCell3 runAction:[CCRepeat actionWithAction:seqAction3 times:3]];
        
        msg = [NSMutableString stringWithFormat:@"[%@] is winner!", [cell1 getOwner]];
    } else if (isGameEnd == YES && [tagsOfWinCells count] == 0) {
        NSLog(@"No one is win in this game\n");
        msg = [NSMutableString stringWithString:@"No one is winner"];
    }
    
    return msg;
    
}

-(NSString*) getOwnerSymbol {
    return ownerSymbol;
}

-(NSMutableArray*) getSeqConnectedCells {
    return seqCellsConnection;
}

-(NSArray*) getSeqTaggedCells {
    return seqCellsTags;
}

-(void) setOwnerSymbol:(NSString*)symbol {
    ownerSymbol = symbol;
}

/*
    Logical Touch methods
 */

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (isGameEnd == NO) {
        
        int selectedTag;
        
        for (int i=1; i<=[cells count]; i++) {
            
            Cell *cell = (Cell*)[self getChildByTag:100 + i];
            CGPoint location  = [self locationFromTouches:touches];
            
            if ([self isTouchInsideCell:cell withTouchLocation:location]) {
                selectedTag = [cell tag];
                
                if (![cell isKnocked]) {
                    
                    [cell setOwner:ownerSymbol];
                    
                    totalKnockedCells++;
                    NSLog(@"total knocked cells is ==> %i\n", totalKnockedCells);
                    
                    if ([ownerSymbol isEqualToString:@"O"]) {
                        ownerSymbol = @"X";
                        [self fillSeqSysWithSymbol:@"O" andSelectedTag:selectedTag];
                    } else if ([ownerSymbol isEqualToString:@"X"]) {
                        ownerSymbol = @"O";
                        [self fillSeqSysWithSymbol:@"X" andSelectedTag:selectedTag];
                    }
                    
                    [cell setKnockState:1];
                    [cell updateBoard];
                    
                }

            }
        }

    } else {
        self.touchEnabled = NO;
    }
    
}


-(CGPoint) locationFromTouches:(NSSet*) touches {
    
    UITouch *touch = touches.anyObject;
    CGPoint touchLocation = [touch locationInView:touch.view];
    return [[CCDirector sharedDirector] convertToGL:touchLocation];
}

/*
    Logical methods
*/

-(void) update:(ccTime)delta {
    
    // Check if someone is win and end game
    for (int i=0; i< [seqCellsConnection count]; i++) {
        
        if(
           ([[[seqCellsConnection objectAtIndex:i] objectAtIndex:0] isEqualToString:@"X"] && [[[seqCellsConnection objectAtIndex:i] objectAtIndex:1] isEqualToString:@"X"] && [[[seqCellsConnection objectAtIndex:i] objectAtIndex:2] isEqualToString:@"X"]) ||
           ([[[seqCellsConnection objectAtIndex:i] objectAtIndex:0] isEqualToString:@"O"] && [[[seqCellsConnection objectAtIndex:i] objectAtIndex:1] isEqualToString:@"O"] && [[[seqCellsConnection objectAtIndex:i] objectAtIndex:2] isEqualToString:@"O"])
           ) {
            
            NSLog(@"\n\n[%@] is winner!\n\n", [[seqCellsConnection objectAtIndex:i] objectAtIndex:0]);
            
            [tagsOfWinCells addObject:[[seqCellsTags objectAtIndex:i] objectAtIndex:0]];
            [tagsOfWinCells addObject:[[seqCellsTags objectAtIndex:i] objectAtIndex:1]];
            [tagsOfWinCells addObject:[[seqCellsTags objectAtIndex:i] objectAtIndex:2]];
            
            NSLog(@"Tags of cells are => {%@, %@, %@}", [tagsOfWinCells objectAtIndex:0], [tagsOfWinCells objectAtIndex:1], [tagsOfWinCells objectAtIndex:2]);
            
            isGameEnd = YES;
            [self unscheduleUpdate];
            
        }
    }
    
    // Check if all cells are knocked and end game
    if (totalKnockedCells == 9) {
        isGameEnd = YES;
    }
    
}

-(BOOL) isGameEnd {
    return isGameEnd;
}

-(void) fillSeqSysWithSymbol:(NSString*) symbol andSelectedTag:(int)tag {
    
    if(tag == 101) {
        [[seqCellsConnection objectAtIndex:0] setObject:symbol atIndex:0];
        [[seqCellsConnection objectAtIndex:1] setObject:symbol atIndex:0];
        [[seqCellsConnection objectAtIndex:2] setObject:symbol atIndex:0];
    }
    
    if(tag == 102) {
        [[seqCellsConnection objectAtIndex:1] setObject:symbol atIndex:1];
        [[seqCellsConnection objectAtIndex:3] setObject:symbol atIndex:0];
    }
    
    if(tag == 103) {
        
        [[seqCellsConnection objectAtIndex:1] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:4] setObject:symbol atIndex:0];
        [[seqCellsConnection objectAtIndex:7] setObject:symbol atIndex:0];

    }

    if(tag == 104) {
        
        [[seqCellsConnection objectAtIndex:2] setObject:symbol atIndex:1];
        [[seqCellsConnection objectAtIndex:5] setObject:symbol atIndex:0];
    }

    if(tag == 105) {
        
        [[seqCellsConnection objectAtIndex:0] setObject:symbol atIndex:1];
        [[seqCellsConnection objectAtIndex:3] setObject:symbol atIndex:1];
        [[seqCellsConnection objectAtIndex:5] setObject:symbol atIndex:1];
        [[seqCellsConnection objectAtIndex:4] setObject:symbol atIndex:1];
    }

    if(tag == 106) {
        
        [[seqCellsConnection objectAtIndex:5] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:7] setObject:symbol atIndex:1];
    }

    if(tag == 107) {
        
        [[seqCellsConnection objectAtIndex:2] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:4] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:6] setObject:symbol atIndex:0];
    }
    
    if(tag == 108) {
        
        [[seqCellsConnection objectAtIndex:3] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:6] setObject:symbol atIndex:1];
    }
    
    if(tag == 109) {
        
        [[seqCellsConnection objectAtIndex:0] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:6] setObject:symbol atIndex:2];
        [[seqCellsConnection objectAtIndex:7] setObject:symbol atIndex:2];
    }
    
}

-(BOOL) isTouchInsideCell:(Cell*) cell withTouchLocation:(CGPoint) location {
    
    if ( location.x > cell.position.x && location.x < (cell.position.x + cell.contentSize.width) && location.y > 174 + cell.position.y && location.y < (174 + cell.position.y + cell.contentSize.height) ) {
        return YES;
    }
    
    return NO;
}

-(BOOL*) checkSeqTaggedCellValueWithByCornerIndex:(int)cornerIndex withItemIndex:(int)itemIndex andSymbol:(NSString*)symbol { // moved to CellsController
    Cell *cell = (Cell*)[self getChildByTag:[[[[self getSeqTaggedCells] objectAtIndex:cornerIndex] objectAtIndex:itemIndex] intValue]];
    NSString *cellValue = [cell getOwnerOnBoard].string;
    if ([symbol length] == 0) {
        if ([symbol length] == [cellValue length]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        if ([cellValue isEqualToString:symbol]) {
            return YES;
        } else {
            return NO;
        }
    }
}

-(BOOL*) checkCellValueByTag:(int)itemIndex andSymbol:(NSString*) symbol { // moved to CellsController
    Cell *cell = (Cell*)[self getChildByTag:itemIndex];
    NSString *cellValue = [cell getOwnerOnBoard].string;
    if ([symbol length] == 0) {
        if ([symbol length] == [cellValue length]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        if ([cellValue isEqualToString:symbol]) {
            return YES;
        } else {
            return NO;
        }
    }
    
}

-(void) knockTheCellByTag:(int) tag {
    Cell *cell = (Cell*)[self getChildByTag:tag];
    if ([cell isKnocked] == NO) {
        [self fillSeqSysWithSymbol:ownerSymbol andSelectedTag:tag];
        [cell setOwner:ownerSymbol];
        [cell setKnockState:1];
        [cell updateBoard];
        totalKnockedCells++;
        NSLog(@"total knocked cells is ==> %i\n", totalKnockedCells);
    }
}

@end
