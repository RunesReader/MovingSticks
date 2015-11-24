//
//  ARRObservableObject.m
//  Carwash
//
//  Created by Igor Arsenkin on 05.08.15.
//  Copyright (c) 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRObservableObject.h"

#import "ARRUniversalMacros.h"

@interface ARRObservableObject ()
@property (nonatomic, retain)   NSHashTable *weakObservers;
@property (nonatomic, assign)   BOOL        shouldNotify;

@end

@implementation ARRObservableObject

#pragma mark -
#pragma mark Deallocation and Initializations

- (void)dealloc {
    self.weakObservers = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.weakObservers = [NSHashTable weakObjectsHashTable];
        self.shouldNotify = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObserversWithSelector:[self selectorWithState:state]];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    [self.weakObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.weakObservers removeObject:observer];
}

- (NSArray *)observers {
    return [self.weakObservers allObjects];
}

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:self];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    [self notifyObserversWithSelector:selector withObject:object withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2 {
    if (!self.shouldNotify) {
        return;
    }
    for (id observer in self.weakObservers) {
        if ([observer respondsToSelector:selector]) {
            ARRSuppressPerformSelectorLeakWarning({
                [observer performSelector:selector withObject:object withObject:object2];
            });
        }
    }
}

- (void)performBlockWithNotification:(void (^)(void))block {
    [self performBlock:block withSetup:YES];
}

- (void)performBlockWithoutNotification:(void (^)(void))block {
    [self performBlock:block withSetup:NO];
}

- (SEL)selectorWithState:(NSUInteger)state {
    return NULL;
}

#pragma mark -
#pragma mark Private

- (void)performBlock:(void (^)(void))block withSetup:(BOOL)shouldNotify {
    if (block) {
        BOOL cacheShouldNotify = self.shouldNotify;
        self.shouldNotify = shouldNotify;
        block();
        self.shouldNotify = cacheShouldNotify;
    }
}

@end
