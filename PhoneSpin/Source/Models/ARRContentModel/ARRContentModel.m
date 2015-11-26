//
//  ARRContentModel.m
//  PhoneSpin
//
//  Created by Igor Arsenkin on 25.11.15.
//  Copyright © 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRContentModel.h"

static NSString * const kARROpeningText = @"Enfold firmly yours phone";
static NSString * const kARRAchievmentText = @"Your MAX achievment was:";
static NSString * const kARRSpinsText = @"spins";
static NSString * const kARRImageName = @"iPhone";

@implementation ARRContentModel

#pragma mark -
#pragma mark Accessors

- (NSString *)openingText {
    return kARROpeningText;
}

- (NSString *)achievmentText {
    return kARRAchievmentText;
}

- (NSString *)spinsText {
    return kARRSpinsText;
}

- (UIImage *)image {
    return [UIImage imageNamed:kARRImageName];
}

@end
