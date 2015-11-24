//
//  UIWindow+ARRWindow.m
//  Task#1
//
//  Created by Igor Arsenkin on 11.09.15.
//  Copyright (c) 2015 Igor Arsenkin. All rights reserved.
//

#import "UIWindow+ARRWindow.h"

@implementation UIWindow (ARRWindow)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
