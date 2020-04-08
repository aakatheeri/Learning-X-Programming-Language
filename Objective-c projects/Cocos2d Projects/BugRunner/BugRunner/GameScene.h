//
//  GameScene.h
//  BugRunner
//
//  Created by Mohammed Alkatheeri on 7/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameScene : CCLayer {
    NSMutableArray *bugs;
}

+(CCScene *) scene;
@end
