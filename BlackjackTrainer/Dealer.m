//
//  Dealer.m
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import "Dealer.h"
#import "Card.h"

@implementation Dealer

- (NSInteger)getUpCardValue {
    return [(Card *)[self.hand objectAtIndex:0] value];
}

- (NSString*)getUpCardValueAsString {
    return [NSString stringWithFormat:@"%ld",(long)self.getUpCardValue ];
}

@end
