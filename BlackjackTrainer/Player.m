//
//  Player.m
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import "Player.h"
#import "Card.h"

@implementation Player

- (id)initNewHand {
    self = [super init];
    
    Card *firstCard = [[Card alloc] initNewCard];
    Card *secondCard = [[Card alloc] initNewCard];
    self.hand = [NSArray arrayWithObjects: firstCard, secondCard, nil];
    
    return self;
}

- (NSInteger)getHandValue {
    return [(Card *)[self.hand objectAtIndex:0] value] + [(Card*)[self.hand objectAtIndex:1] value];
}

- (NSString*)getHandValueAsString {
    if (([(Card *)[self.hand objectAtIndex:0] value] == 11) &&([(Card*)[self.hand objectAtIndex:1] value] == 11)) {
        return @"12";
    }
    return [NSString stringWithFormat:@"%ld", (long)self.getHandValue];
}

- (BOOL)hasDoubles {
    return [(Card *)[self.hand objectAtIndex:0] value] == [(Card*)[self.hand objectAtIndex:1] value];
}

- (BOOL)hasAce {
    return ([(Card *)[self.hand objectAtIndex:0] value] == 11) || ([(Card*)[self.hand objectAtIndex:1] value] == 11);
}

@end
