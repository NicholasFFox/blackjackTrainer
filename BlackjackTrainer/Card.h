//
//  Card.h
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject

@property (nonatomic) int value;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *cardLabel;

- (id)initNewCard;

@end
