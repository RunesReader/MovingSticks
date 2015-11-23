//
//  ARRContext.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRContext.h"

#import "ARRSceneManager.h"

static const NSTimeInterval kARRTransitionFadeInterval  = 1.0;

@implementation ARRContext

#pragma mark -
#pragma mark Initializations and Deallocation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scoreModel = [ARRScoreModel sharedScoreModel];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)winTouchOnScene {
    ARRScoreModel *scoreModel = self.scoreModel;
    ARRSetGameParameters *gameParameters = self.gameParameters;
    
    scoreModel.currentScore = scoreModel.currentScore + gameParameters.winPoints;
    if (scoreModel.currentScore >= gameParameters.nextLevelPoints) {
        [ARRSceneManager presentScene:gameParameters.nextLevelSceneName withFading:kARRTransitionFadeInterval];
    }
}

- (void)failTouchOnScene {
    ARRScoreModel *scoreModel = self.scoreModel;
    ARRSetGameParameters *gameParameters = self.gameParameters;
    
    scoreModel.currentScore = scoreModel.currentScore - gameParameters.failPoints;
    if (scoreModel.currentScore < 0) {
        [ARRSceneManager presentScene:gameParameters.gameOverSceneName withFading:kARRTransitionFadeInterval];
    }
}

@end
