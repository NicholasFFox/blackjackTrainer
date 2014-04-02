//
//  BasicStrategy.m
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/31/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import "BasicStrategy.h"

@implementation BasicStrategy

@synthesize aces = _aces;
@synthesize doubles = _doubles;
@synthesize numbers = _numbers;

//- (id)initBasicStrategy
- (instancetype)init
{
    self = [super init];
    
    NSNumber *h = @1;
    NSNumber *d = @2;
    NSNumber *x = @3;
    NSNumber *s = @4;
    
    if (self) {
        
        //         modeled =2 3 4 5 6 7 8 9 10a
        self.numbers = @[ @[h,h,h,h,h,h,h,h,h,h], //<=8
                          @[h,d,d,d,d,h,h,h,h,h], //9
                          @[d,d,d,d,d,d,d,d,h,h], //10
                          @[d,d,d,d,d,d,d,d,d,h], //11
                          @[h,h,s,s,s,h,h,h,h,h], //12
                          @[s,s,s,s,s,h,h,h,h,h], //13 - 16
                          @[s,s,s,s,s,s,s,s,s,s]  //17+
                         ];
        
        //      modeled =2 3 4 5 6 7 8 9 10a
        self.aces = @[ @[h,h,h,d,d,h,h,h,h,h], //a2 - a3
                       @[h,h,d,d,d,h,h,h,h,h], //a4 - a5
                       @[h,d,d,d,d,h,h,h,h,h], //a6
                       @[s,d,d,d,d,s,s,h,h,h], //a7
                       @[s,s,s,s,s,s,s,s,s,s]  //a8-a10
                       ];
        
        //         modeled =2 3 4 5 6 7 8 9 10a
        self.doubles = @[ @[h,h,x,x,x,x,h,h,h,h], //2&3
                          @[h,h,h,h,h,h,h,h,h,h], //4
                          @[d,d,d,d,d,d,d,d,h,h], //5
                          @[h,x,x,x,x,h,h,h,h,h], //6
                          @[x,x,x,x,x,x,h,h,h,h], //7
                          @[x,x,x,x,x,x,x,x,x,x], //8 & a
                          @[x,x,x,x,x,s,x,x,s,s], //9
                          @[s,s,s,s,s,s,s,s,s,s] //10
                          ];
    }
    
    return self;
}


- (NSNumber*)checkAce:(int)player against:(int)dealer {
    int dealerIndex = dealer-2;
    int playerIndex = 0;
    
    switch (player) {
        case 13:
        case 14:
            playerIndex = 0;
            break;
        case 15:
        case 16:
            playerIndex = 1;
            break;
        case 17:
            playerIndex = 2;
            break;
        case 18:
            playerIndex = 3;
            break;
        default:
            playerIndex = 4;
            break;
    }
    
    return self.aces[playerIndex][dealerIndex];
}

- (NSNumber*)checkDoubles:(int)player against:(int)dealer {
    int dealerIndex = dealer-2;
    int playerIndex = 0;
    
    switch (player) {
        case 4:
        case 6:
            playerIndex = 0;
            break;
        case 8:
            playerIndex = 1;
            break;
        case 10:
            playerIndex = 2;
            break;
        case 12:
            playerIndex = 3;
            break;
        case 14:
            playerIndex = 4;
            break;
        case 16:
        case 22:
            playerIndex = 5;
            break;
        case 18:
            playerIndex = 6;
            break;
        default:
            playerIndex = 7;
            break;
    }
    
    return self.doubles[playerIndex][dealerIndex];
}


- (NSNumber*)checkNumber:(int)player against:(int)dealer {
    int dealerIndex = dealer-2;
    int playerIndex = 0;
    
    switch (player) {
        case 5:
        case 6:
        case 7:
        case 8:
            playerIndex = 0;
            break;
        case 9:
            playerIndex = 1;
            break;
        case 10:
            playerIndex = 2;
            break;
        case 11:
            playerIndex = 3;
            break;
        case 12:
            playerIndex = 4;
            break;
        case 13:
        case 14:
        case 15:
        case 16:
            playerIndex = 5;
            break;
        default:
            playerIndex = 6;
            break;
    }
    //NSLog(@"dealerIndex:%d",dealerIndex);
    //NSLog(@"playerIndex:%d", playerIndex);
    //NSLog(@"Returning:%@", self.numbers[playerIndex][dealerIndex]);
    return self.numbers[playerIndex][dealerIndex] ;
}

@end
