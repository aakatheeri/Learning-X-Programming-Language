//
//  HelloWorldLayer.h
//  Rawne
//
//  Created by Ahmed Alkatheeri on 10/9/13.
//  Copyright Ahmed Alkatheeri 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
