//
//  PlayingData.h
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 2/17/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayingData : NSObject {
    NSDictionary *playingDataDic;
}
-(NSString*) getCurrentChosenSymbol;
-(NSString*) getPlayTypeFromPlayingDataFile;
-(void) saveCurrentPlayingType:(NSString*)type;
-(void) saveCurrentSymbol:(NSString*)symbol;
-(NSString *)playingDataFilePath;
@end
