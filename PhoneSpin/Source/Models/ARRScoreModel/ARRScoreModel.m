//
//  ARRScoreModel.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRScoreModel.h"

static NSString * const kARRKeyForHighScore = @"highScore";

static NSString * const kARRLevelZeroName   = @"UNMOVABLE";
static NSString * const kARRLevelOneName    = @"DOG'S TAIL";
static NSString * const kARRLevelTwoName    = @"MILL";
static NSString * const kARRLevelThreeName  = @"FAN";
static NSString * const kARRLevelFourName   = @"CENTRIFUGE";
static NSString * const kARRLevelFiveName   = @"LARGE HADRON COLLIDER";

static const NSInteger  kARRLevelOne        = 1;
static const NSInteger  kARRLevelTwo        = 5;
static const NSInteger  kARRLevelThree      = 10;
static const NSInteger  kARRLevelFour       = 15;
static const NSInteger  kARRLevelFive       = 20;

@interface ARRScoreModel ()
@property (nonatomic, assign) NSInteger highScore;
@property (nonatomic, assign) NSInteger maxCurrentScore;

@end

@implementation ARRScoreModel

#pragma mark -
#pragma mark Class Method

+ (instancetype)sharedScoreModel {
    static id __model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __model = [self new];
    });
    
    return __model;
}

#pragma mark -
#pragma mark Accessors

- (void)setCurrentScore:(NSInteger)currentScore {
    if (currentScore != _currentScore) {
        _currentScore = currentScore;
        if (_currentScore > self.maxCurrentScore) {
            self.maxCurrentScore = _currentScore;
        }
    }
}

- (void)setMaxCurrentScore:(NSInteger)maxCurrentScore {
    if (maxCurrentScore != _maxCurrentScore) {
        _maxCurrentScore = maxCurrentScore;
        if (_maxCurrentScore > self.highScore) {
            self.highScore = _maxCurrentScore;
        }
    }
}

- (NSInteger)highScore {
    if (0 == _highScore) {
        _highScore = [[NSUserDefaults standardUserDefaults] integerForKey:kARRKeyForHighScore];
    }

    return _highScore;
}

#pragma mark -
#pragma mark Public

- (void)resetMaxCurrentScore {
    self.maxCurrentScore = 0;
}

- (void)save {
    [[NSUserDefaults standardUserDefaults] setInteger:self.highScore forKey:kARRKeyForHighScore];
}

- (NSString *)achievementNameWithScore:(NSInteger)score {
    if (score < kARRLevelOne) {
        return kARRLevelZeroName;
    } else if (score < kARRLevelTwo) {
        return kARRLevelOneName;
    } else if (score < kARRLevelThree) {
        return kARRLevelTwoName;
    } else if (score < kARRLevelFour) {
        return kARRLevelThreeName;
    } else if (score < kARRLevelFive) {
        return kARRLevelFourName;
    }
    
    return kARRLevelFiveName;
}

@end
