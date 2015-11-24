//
//  ARRObservableObject.h
//  Carwash
//
//  Created by Igor Arsenkin on 05.08.15.
//  Copyright (c) 2015 Igor Arsenkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;


- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (NSArray *)observers;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object withObject:(id)object2;

- (void)performBlockWithNotification:(void(^)(void))block;
- (void)performBlockWithoutNotification:(void(^)(void))block;

// Only for subclassing. Do not invoke directly.
- (SEL)selectorWithState:(NSUInteger)state;

@end
