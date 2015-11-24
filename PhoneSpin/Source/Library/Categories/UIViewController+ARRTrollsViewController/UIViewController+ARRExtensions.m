//
//  UIViewController+ARRExtensions.m
//  Task#1
//
//  Created by Igor Arsenkin on 15.09.15.
//  Copyright (c) 2015 Igor Arsenkin. All rights reserved.
//

#import "UIViewController+ARRExtensions.h"

@implementation UIViewController (ARRExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controller {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return nil;
}

@end
