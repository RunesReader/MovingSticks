//
//  ARRGameOverScene.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 16.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRGameOverScene.h"

#import "ARRScoreModel.h"
#import "ARRSceneManager.h"

static NSString * const     kARRStartSceneName            = @"StartScene";
static const NSTimeInterval kARRTransitionFadeInterval  = 1.0;

@interface ARRGameOverScene ()
@property (nonatomic, strong)   ARRScoreModel   *scoreModel;

@end

@implementation ARRGameOverScene

#pragma mark -
#pragma mark CCBReader Method

- (void)didLoadFromCCB {
    self.scoreModel = [ARRScoreModel sharedScoreModel];
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
    self.currentScoreLabel.string = [NSString stringWithFormat:@"%li", (long)model.maxCurrentScore];
}

#pragma mark -
#pragma mark Actions

- (void)playButtonPressed:(CCButton *)sender {
    [ARRSceneManager presentScene:kARRStartSceneName withFading:kARRTransitionFadeInterval];
}

@end
