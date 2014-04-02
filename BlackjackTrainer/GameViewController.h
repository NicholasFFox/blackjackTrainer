//
//  GameViewController.h
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player;
@class Dealer;
@class BasicStrategy;

@interface GameViewController : UIViewController

//Display Aspects

//Dealer
@property (strong, nonatomic) IBOutlet UILabel *upCardLabel;
@property (strong, nonatomic) IBOutlet UILabel *dealerScoreLabel;
@property (strong, nonatomic) IBOutlet UIImageView *upCardImage;


//Player
@property (strong, nonatomic) IBOutlet UILabel *cardOneLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardTwoLabel;
@property (strong, nonatomic) IBOutlet UIImageView *cardOneImage;
@property (strong, nonatomic) IBOutlet UIImageView *cardTwoImage;
@property (strong, nonatomic) IBOutlet UILabel *playerScoreLabel;

//other display stuff
@property (strong, nonatomic) IBOutlet UILabel *streakLabel;

//Button
- (IBAction)checkAction:(id)sender;


//Core Game Objects
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) Dealer *dealer;
@property (strong, nonatomic) BasicStrategy *basicStrategy;
@property (strong, nonatomic) NSNumber *action;
@property int streak;


//Methods implementing basic strategy
- (BOOL)isCorrectAction;

@end
