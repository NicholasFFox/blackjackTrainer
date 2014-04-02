//
//  BasicStrategy.h
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/31/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicStrategy : NSObject

@property (strong, nonatomic) NSArray *aces;
@property (strong, nonatomic) NSArray *doubles;
@property (strong, nonatomic) NSArray *numbers;

//- (id)initBasicStrategy;

- (NSNumber*)checkAce:(int)player against:(int)dealer;
- (NSNumber*)checkDoubles:(int)player against:(int)dealer;
- (NSNumber*)checkNumber:(int)player against:(int)dealer;


@end
