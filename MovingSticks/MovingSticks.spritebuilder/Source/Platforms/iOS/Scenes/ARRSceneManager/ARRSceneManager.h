//
//  ARRSceneManager.h
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRSceneManager : NSObject

+ (void)presentScene:(NSString *)sceneName withFading:(NSTimeInterval)interval;

@end
