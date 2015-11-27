//
//  ARRContentModel.m
//  PhoneSpin
//
//  Created by Igor Arsenkin on 25.11.15.
//  Copyright © 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRContentModel.h"

static NSString * const kARROpeningText     = @"Hold firmly your phone";
static NSString * const kARRachievementText  = @"Your MAX achievement was:";
static NSString * const kARRSpinsText       = @"spins";
static NSString * const kARRImageName       = @"iPhone";

@implementation ARRContentModel

#pragma mark -
#pragma mark Accessors

- (NSString *)openingText {
    return kARROpeningText;
}

- (NSString *)achievementText {
    return kARRachievementText;
}

- (NSString *)spinsText {
    return kARRSpinsText;
}

- (UIImage *)image {
    return [UIImage imageNamed:kARRImageName];
}

@end
