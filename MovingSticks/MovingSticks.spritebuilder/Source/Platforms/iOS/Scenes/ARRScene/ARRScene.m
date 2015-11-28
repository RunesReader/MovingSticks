//
//  ARRScene.m
//  MovingSticks
//
//  Created by Igor Arsenkin on 15.11.15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "ARRScene.h"

static NSString * const kARRStickName               = @"bambooStick";
static NSString * const kARRFrameName               = @"bambooFrame";
static const CCTime     kARRMoveDurationBambooStick = 2.0;
static const CCTime     kARRInterestingFactor       = 0.1;

static const NSInteger  kARRWinFactorLevel1         = 2;
static const NSInteger  kARRWinFactorLevel2         = 10;
static const NSInteger  kARRWinFactorLevel3         = 100;

static NSString * const kARRLevel2Name              = @"Level2";
static NSString * const kARRLevel3Name              = @"Level3";
static NSString * const kARRStartSceneName          = @"StartScene";

static NSString * const kARRPlistName               = @"LevelsMetadata";
static NSString * const kARRPlistType               = @"plist";

@interface ARRScene ()
@property (nonatomic, assign) NSUInteger    sticksCount;
@property (nonatomic, strong) NSDictionary  *levelsMetadata;

@end

@implementation ARRScene

#pragma mark -
#pragma mark CCBReader Method

- (void)didLoadFromCCB {
    NSString *path = [[NSBundle mainBundle] pathForResource:kARRPlistName ofType:kARRPlistType];
    self.levelsMetadata = [NSDictionary dictionaryWithContentsOfFile:path];
    
    [self addAllNodesToItsArrays];
    NSUInteger sticksCount = self.sticksCount;
    
    NSInteger factor = [self winFactorWithSticksAmount:sticksCount];
    NSString *levelName = [self nextLevelNameWithSticksAmount:sticksCount];
    
    [self setupLevelWithWinFactor:factor nextLevelName:levelName];
    
    [self startMoveSticks];
}

#pragma mark -
#pragma mark Accessors

- (void)setContext:(ARRContext *)context {
    if (_context != context) {
        _context = context;
    }
    
    [self fillWithModel:context.scoreModel];
}

#pragma mark -
#pragma mark Public

- (BOOL)nodesIntersects {
    BOOL result = NO;
    
    for (NSUInteger i = 0; i < self.sticksCount; i++) {
        CCNode *stick = [self.sticks pointerAtIndex:i];
        CCNode *frame = [self.frames pointerAtIndex:i];
        
        result = CGRectIntersectsRect(stick.boundingBox, frame.boundingBox);
        if (!result) {
            return NO;
        }
    }
    
    return YES;
}

- (void)moveStick:(CCNode *)stick relativlyFrame:(CCNode *)frame duration:(CCTime)duration {
    CGPoint endPosition = [self endStickPosition:stick relativlyFrame:frame];
    
    id forwardMove = [CCActionMoveTo actionWithDuration:duration
                                               position:endPosition];
    id reverseMove = [CCActionMoveTo actionWithDuration:duration
                                               position:stick.position];
    id sequence = [CCActionSequence actionWithArray:@[forwardMove, reverseMove]];
    id forever = [CCActionRepeatForever actionWithAction:sequence];
    
    [stick runAction:forever];
}

- (void)fillWithModel:(ARRScoreModel *)model {
    self.scoreLabel.string = [NSString stringWithFormat:@"%li", (long)model.currentScore];
}

- (void)setupLevelWithWinFactor:(NSInteger)factor nextLevelName:(NSString *)name {
    self.userInteractionEnabled = YES;
    
    ARRSetGameParameters *parameters = [[ARRSetGameParameters alloc] initWithWinPoints:factor];
    parameters.nextLevelSceneName = name;
    
    ARRContext *context = [ARRContext new];
    context.gameParameters = parameters;
    self.context = context;
    
    if (kARRThirdLevel == self.sticksCount) {
        [context.gameParameters setLastLevelPoints];
    }

}

- (void)addAllNodesToItsArrays {
    self.sticks = [NSPointerArray weakObjectsPointerArray];
    self.frames = [NSPointerArray weakObjectsPointerArray];
    
    [self addToArray:self.sticks nodesWithName:kARRStickName];
    [self addToArray:self.frames nodesWithName:kARRFrameName];
    
    self.sticksCount = self.sticks.count;
}

#pragma mark -
#pragma mark User Interactions

- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    ARRContext *context = self.context;
    
    if ([self nodesIntersects]) {
        [context winTouchOnScene];
    } else {
        [context failTouchOnScene];
    }
    
    [self fillWithModel:context.scoreModel];
}

#pragma mark -
#pragma mark Private

- (CGPoint)endStickPosition:(CCNode *)stick relativlyFrame:(CCNode *)frame {
    return CGPointMake(2 * frame.position.x - stick.position.x, stick.position.y);
}

- (void)addToArray:(NSPointerArray *)array nodesWithName:(NSString *)name {
    CCNode *node = nil;
    NSInteger index = 1;
    
    do {
        NSString *fullName = [NSString stringWithFormat:@"%@%ld", name, (long)index];
        node = [self getChildByName:fullName recursively:NO];
        if (node) {
            [array addPointer:(__bridge void * _Nullable)(node)];
        }
        
        index++;
        
    } while (node);
}

- (void)startMoveSticks {
    for (NSUInteger i = 0; i < self.sticksCount; i++) {
        [self moveStick:[self.sticks pointerAtIndex:i]
         relativlyFrame:[self.frames pointerAtIndex:i]
               duration:kARRMoveDurationBambooStick - i * kARRInterestingFactor];
    }
}

- (NSInteger)winFactorWithSticksAmount:(NSUInteger)amount {
    NSArray *levelMetadata = [self.levelsMetadata objectForKey:[NSString stringWithFormat:@"%lu", (unsigned long)amount]];
    
    return [[levelMetadata objectAtIndex:0] integerValue];
}

- (NSString *)nextLevelNameWithSticksAmount:(NSUInteger)amount {
    NSArray *levelMetadata = [self.levelsMetadata objectForKey:[NSString stringWithFormat:@"%lu", (unsigned long)amount]];
    
    return [levelMetadata objectAtIndex:1];
}

@end
