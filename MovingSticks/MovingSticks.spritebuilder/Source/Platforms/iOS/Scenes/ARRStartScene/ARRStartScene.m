//
//  ARRStartScene.m
//
//  Created by : Igor Arsenkin
//  Project    : MovingSticks
//  Date       : 13.11.15
//
//  Copyright (c) 2015 Apportable.
//  All rights reserved.
//

#import "ARRStartScene.h"

#import "ARRScoreModel.h"
#import "ARRSceneManager.h"

static NSString * const     kARRLevel_1_Name            = @"Level_1";
static const NSTimeInterval kARRTransitionFadeInterval  = 2.0;

@interface ARRStartScene ()
@property (nonatomic, strong)   ARRScoreModel   *scoreModel;

@end

@implementation ARRStartScene

#pragma mark -
#pragma mark CCBReader Method

- (void)didLoadFromCCB {
    self.scoreModel = [ARRScoreModel sharedScoreModel];
    ARRScoreModel *scoreModel = self.scoreModel;
    
    scoreModel.currentScore = 0;
    [scoreModel resetMaxCurrentScore];
}

#pragma mark -
#pragma mark Accessors

- (void)setScoreModel:(ARRScoreModel *)scoreModel {
    if (_scoreModel != scoreModel) {
        _scoreModel = scoreModel;
    }
    
    [self fillWithModel:scoreModel];
}

#pragma mark -
#pragma mark Private

- (void)fillWithModel:(ARRScoreModel *)model {
    self.highScoreLabel.string = [NSString stringWithFormat:@"%li", (long)model.highScore];
}

#pragma mark -
#pragma mark Actions

- (void)startButtonPressed:(CCButton *)sender {
    [ARRSceneManager presentScene:kARRLevel_1_Name withFading:kARRTransitionFadeInterval];
}

@end
