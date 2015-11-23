//
//  ARRSetGameParameters.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 18.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRSetGameParameters.h"

static const NSInteger  kARRFailFactor               = 2;
static const NSInteger  kARRJumpToNextLevelFactor    = 10;
static NSString * const kARRGameOverSceneName        = @"GameOverScene";

@interface ARRSetGameParameters ()
@property (nonatomic, assign) NSInteger   winPoints;
@property (nonatomic, assign) NSInteger   failPoints;
@property (nonatomic, assign) NSInteger   nextLevelPoints;

@end

@implementation ARRSetGameParameters

#pragma mark -
#pragma mark Initializations and Deallocation

- (instancetype)init {
    return [self initWithWinPoints:0];
}

- (instancetype)initWithWinPoints:(NSInteger)points {
    self = [super init];
    if (self) {
        self.winPoints = points;
        self.failPoints = points / kARRFailFactor;
        self.nextLevelPoints = kARRJumpToNextLevelFactor * points;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)gameOverSceneName {
    return kARRGameOverSceneName;
}

#pragma mark -
#pragma mark Public

- (void)setLastLevelPoints {
    self.nextLevelPoints = NSIntegerMax;
}

@end
