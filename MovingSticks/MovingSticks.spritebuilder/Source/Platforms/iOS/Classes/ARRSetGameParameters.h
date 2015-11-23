//
//  ARRSetGameParameters.h
//  MovingSticks
//
//  Created by Igor Arsenkin on 18.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRSetGameParameters : NSObject
@property (nonatomic, readonly) NSInteger   winPoints;
@property (nonatomic, readonly) NSInteger   failPoints; // winPoints / 2
@property (nonatomic, readonly) NSInteger   nextLevelPoints; // winPoints * 10
@property (nonatomic, readonly) NSString    *gameOverSceneName;
@property (nonatomic, copy)     NSString    *nextLevelSceneName;

// Do not invoke -init!
- (instancetype)initWithWinPoints:(NSInteger)points NS_DESIGNATED_INITIALIZER;

- (void)setLastLevelPoints;

@end
