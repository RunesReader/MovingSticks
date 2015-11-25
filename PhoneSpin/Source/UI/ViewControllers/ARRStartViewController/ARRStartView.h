//
//  ARRStartView.h
//  PhoneSpin
//
//  Created by Igor Arsenkin on 25.11.15.
//  Copyright © 2015 Igor Arsenkin. All rights reserved.
//

#import "ARRView.h"

@interface ARRStartView : ARRView
@property (nonatomic, weak) IBOutlet UILabel        *openingText;
@property (nonatomic, weak) IBOutlet UILabel        *achievmentText;
@property (nonatomic, weak) IBOutlet UILabel        *maxAchievment;
@property (nonatomic, weak) IBOutlet UILabel        *spinsText;
@property (nonatomic, weak) IBOutlet UILabel        *nameOfAchievment;
@property (nonatomic, weak) IBOutlet UIImageView    *image;

@end
