//
//  ARRStick.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 28.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRStick.h"

@implementation ARRStick

#pragma mark -
#pragma mark Public

- (void)moveStickRelativlyFrame:(CCNode *)frame duration:(CCTime)duration {
    CGPoint endPosition = [self endStickPositionRelativlyFrame:frame];
    
    id forwardMove = [CCActionMoveTo actionWithDuration:duration
                                               position:endPosition];
    id reverseMove = [CCActionMoveTo actionWithDuration:duration
                                               position:self.position];
    id sequence = [CCActionSequence actionWithArray:@[forwardMove, reverseMove]];
    id forever = [CCActionRepeatForever actionWithAction:sequence];
    
    [self runAction:forever];
}

#pragma mark -
#pragma mark Private

- (CGPoint)endStickPositionRelativlyFrame:(CCNode *)frame {
    CGPoint position = self.position;
    
    return CGPointMake(2 * frame.position.x - position.x, position.y);
}

@end
