//
//  playingData.h
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayingData : NSObject {
    NSDictionary *playingDataDic;
}
-(void) initialPlayingData;
-(NSString*) getCurrentChosenSymbol;
-(NSString*) getPlayTypeFromPlayingDataFile;
-(NSString*) getStatusOfSoundsFromPlayingDataFile;
-(NSString*) getStatusOfMusicFromPlayingDataFile;
-(void) saveCurrentPlayingType:(NSString*)type;
-(void) saveCurrentSymbol:(NSString*)symbol;
-(void) setSoundsStatus:(NSString*) status;
-(void) setMusicStatus:(NSString*) status;
-(NSString *)playingDataFilePath;
@end
