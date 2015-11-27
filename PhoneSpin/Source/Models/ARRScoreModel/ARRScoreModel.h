//
//  ARRScoreModel.h
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRScoreModel : NSObject
@property (nonatomic, readonly) NSInteger highScore;
@property (nonatomic, readonly) NSInteger maxCurrentScore;
@property (nonatomic, assign)   NSInteger currentScore;

+ (instancetype)sharedScoreModel;

- (void)resetMaxCurrentScore;
- (void)save;
- (NSString *)achievementNameWithScore:(NSInteger)score;

@end
