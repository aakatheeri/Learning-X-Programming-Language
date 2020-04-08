//
//  playingData.m
//  Golden Tic Tac Toe
//
//  Created by Ahmed Alkatheeri on 4/19/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "PlayingData.h"

@implementation PlayingData

-(id) init {
    
    if (self=[super init]) {
        
        playingDataDic = [[NSDictionary alloc] initWithContentsOfFile:[self playingDataFilePath]];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:[self playingDataFilePath]]) {
            [self initialPlayingData];
        }
    }
    
    
    return self;
}

-(void) initialPlayingData {
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"-", @"-", @"Enable", @"Enable", nil] forKeys:[NSArray arrayWithObjects:@"currentSymbol", @"playType", @"musicOnGame", @"soundsOnGame", nil]];
    NSString *path = [self playingDataFilePath];
    [dic writeToFile:path atomically:YES];

}

-(NSString*) getCurrentChosenSymbol {
    return [playingDataDic objectForKey:@"currentSymbol"];
}

-(NSString*) getPlayTypeFromPlayingDataFile {
    return [playingDataDic valueForKey:@"playType"];
}

-(NSString*) getStatusOfSoundsFromPlayingDataFile {
    return [playingDataDic valueForKey:@"soundsOnGame"];
}

-(NSString*) getStatusOfMusicFromPlayingDataFile {
    return [playingDataDic valueForKey:@"musicOnGame"];
}

-(void) saveCurrentPlayingType:(NSString*)type {
    
    [playingDataDic setValue:type forKey:@"playType"];
    if ([playingDataDic writeToFile:[self playingDataFilePath] atomically:YES]) {
        NSLog(@"The data is saved! \n");
        NSLog(@"You choose to play with (%@)\n", [playingDataDic objectForKey:@"playType"]);
    }
}

-(void) saveCurrentSymbol:(NSString*)symbol {
    
    [playingDataDic setValue:symbol forKey:@"currentSymbol"];
    if ([playingDataDic writeToFile:[self playingDataFilePath] atomically:YES]) {
        NSLog(@"The data is saved! \n");
        NSLog(@"You choose to play with (%@)\n", [playingDataDic objectForKey:@"currentSymbol"]);
    }
}

-(void) setSoundsStatus:(NSString*) status {
    [playingDataDic setValue:status forKey:@"soundsOnGame"];
    if ([playingDataDic writeToFile:[self playingDataFilePath] atomically:YES]) {
        NSLog(@"The data is saved! \n");
        NSLog(@"You %@ sounds on game", status);
    }
}

-(void) setMusicStatus:(NSString*) status {
    [playingDataDic setValue:status forKey:@"musicOnGame"];
    if ([playingDataDic writeToFile:[self playingDataFilePath] atomically:YES]) {
        NSLog(@"The data is saved! \n");
        NSLog(@"You %@ music on game", status);
    }
}

- (NSString *)playingDataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"playingData.plist"];
}

@end