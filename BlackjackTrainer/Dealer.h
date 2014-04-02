//
//  Dealer.h
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import "Player.h"

@interface Dealer : Player

- (NSInteger)getUpCardValue;
- (NSString*)getUpCardValueAsString;

@end
