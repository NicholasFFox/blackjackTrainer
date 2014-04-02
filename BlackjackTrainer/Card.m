//
//  Card.m
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import "Card.h"


@implementation Card

@synthesize value = _value;
@synthesize cardLabel = _cardLabel;
@synthesize image = _image;


- (id)initNewCard {
    self = [super init];
    
    //generate seed values
    int suite = arc4random_uniform(4);
    self.value = arc4random_uniform(13);
    
    //Set string appropriately for background image of card
    NSString *imageName;
    switch (suite) {
        case 0:
            imageName = @"heart.png";
            break;
        case 1:
            imageName = @"diamond.png";
            break;
        case 2:
            imageName = @"club.png";
            break;
        default:
            imageName = @"spade.png";
            break;
    }
    self.image = [UIImage imageNamed:imageName];
    
    //Set Label String appropriately
    switch (self.value) {
        case 0:
            self.cardLabel = @"K";
            self.value = 10;
            break;
        case 11:
            self.cardLabel = @"Q";
            self.value = 10;
            break;
        case 12:
            self.cardLabel = @"J";
            self.value = 10;
            break;
        case 1:
            self.cardLabel = @"A";
            self.value = 11;
            break;
        default:
            self.cardLabel = [NSString stringWithFormat:@"%d", self.value];
            break;
    }
    
    return self;
}

@end
