//
//  ARRStartView.m
//  PhoneSpin
//
//  Created by Igor Arsenkin on 25.11.15.
//  Copyright © 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRStartView.h"

#import "ARRContentModel.h"
#import "ARRScoreModel.h"

@interface ARRStartView ()
@property (nonatomic, assign, getter=areSubviewsVisible)    BOOL    subviewsVisible;

@end

@implementation ARRStartView

#pragma mark -
#pragma mark Initializations and Deallocation

- (void)dealloc {
    self.contentModel = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentModel = [ARRContentModel new];
}

#pragma mark -
#pragma mark Accessors

- (void)setContentModel:(ARRContentModel *)contentModel {
    if (_contentModel != contentModel) {
        _contentModel = contentModel;
        [self fillWithContentModel:contentModel];
        self.subviewsVisible = YES;
    }
}

#pragma mark -
#pragma mark Private Accessors

- (void)setSubviewsVisible:(BOOL)subviewsVisible {
    if (_subviewsVisible != subviewsVisible) {
        _subviewsVisible = subviewsVisible;
        
        NSArray *contentSubviews = self.contentsSubviews;
        for (UIView *view in contentSubviews) {
            view.hidden = !_subviewsVisible;
        }
        
        self.countDownText.hidden = _subviewsVisible;
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithContentModel:(ARRContentModel *)model {
    self.openingText.text = model.openingText;
    self.achievementText.text = model.achievementText;
    self.spinsText.text = model.spinsText;
    self.contentImageView.image = model.image;
}



#pragma mark -
#pragma mark Event Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.subviewsVisible = NO;
}

@end
