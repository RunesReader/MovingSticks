//
//  ARRScene.h
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "CCNode.h"

#import "ARRScoreModel.h"
#import "ARRContext.h"

@class ARRStick;

typedef NS_ENUM(NSUInteger, ARRGameLevel) {
    kARRFirstLevel = 1,
    kARRSecondLevel,
    kARRThirdLevel
};

@interface ARRScene : CCNode
@property (nonatomic, strong)   ARRContext      *context;
@property (nonatomic, weak)     CCLabelBMFont   *scoreLabel;
@property (nonatomic, strong)   NSPointerArray  *sticks;
@property (nonatomic, strong)   NSPointerArray  *frames;

- (BOOL)nodesIntersects;
- (void)fillWithModel:(ARRScoreModel *)model;

@end
