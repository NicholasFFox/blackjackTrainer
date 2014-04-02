//
//  Player.h
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong, nonatomic) NSArray *hand;

- (id)initNewHand;

- (NSInteger)getHandValue;
- (NSString*)getHandValueAsString;

- (BOOL)hasDoubles;
- (BOOL)hasAce;

@end
