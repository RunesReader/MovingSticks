//
//  ARRSceneManager.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRSceneManager.h"

@implementation ARRSceneManager

#pragma mark -
#pragma mark Class Method

+ (void)presentScene:(NSString *)sceneName withFading:(NSTimeInterval)interval {
    id scene = [CCBReader loadAsScene:sceneName];
    id transition = [CCTransition transitionFadeWithDuration:interval];
    [[CCDirector sharedDirector] presentScene:scene withTransition:transition];
}

@end
