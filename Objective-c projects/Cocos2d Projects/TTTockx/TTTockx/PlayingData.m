//
//  PlayingData.m
//  TTTockx
//
//  Created by Ahmed Alkatheeri on 2/17/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#import "PlayingData.h"

@implementation PlayingData

-(id) init {
    
    if (self=[super init]) {
        
        playingDataDic = [[NSDictionary alloc] initWithContentsOfFile:[self playingDataFilePath]];
    }
    
    return self;
}

-(NSString*) getCurrentChosenSymbol {
    return [playingDataDic objectForKey:@"currentSymbol"];
}

-(NSString*) getPlayTypeFromPlayingDataFile {
    return [playingDataDic valueForKey:@"playType"];
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

- (NSString *)playingDataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"playingData.plist"];
}

@end
