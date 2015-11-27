//
//  ARRStartView.h
//  PhoneSpin
//
//  Created by Igor Arsenkin on 25.11.15.
//  Copyright © 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRView.h"

@class ARRContentModel;
@class ARRScoreModel;

@interface ARRStartView : ARRView
@property (nonatomic, weak)     IBOutlet UILabel                    *openingText;
@property (nonatomic, weak)     IBOutlet UILabel                    *achievementText;
@property (nonatomic, weak)     IBOutlet UILabel                    *maxachievement;
@property (nonatomic, weak)     IBOutlet UILabel                    *spinsText;
@property (nonatomic, weak)     IBOutlet UILabel                    *nameOfachievement;
@property (nonatomic, weak)     IBOutlet UIImageView                *contentImageView;
@property (nonatomic, strong)   IBOutletCollection(UIView) NSArray  *contentsSubviews;
@property (nonatomic, weak)     IBOutlet UILabel                    *countDownText;

@property (nonatomic, strong)   ARRContentModel                     *contentModel;
@property (nonatomic, strong)   ARRScoreModel                       *scoreModel;

- (void)fillWithContentModel:(ARRContentModel *)model;
- (void)fillWithScoreModel:(ARRScoreModel *)model;

@end
