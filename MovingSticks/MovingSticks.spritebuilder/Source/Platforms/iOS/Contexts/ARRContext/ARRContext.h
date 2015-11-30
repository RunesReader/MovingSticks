//
//  ARRContext.h
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ARRScoreModel.h"
#import "ARRSetGameParameters.h"

@interface ARRContext : NSObject
@property (nonatomic, strong)   ARRScoreModel           *scoreModel;
@property (nonatomic, strong)   ARRSetGameParameters    *gameParameters;

- (void)winTouchOnScene;
- (void)failTouchOnScene;

@end
