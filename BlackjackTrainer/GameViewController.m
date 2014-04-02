//
//  GameViewController.m
//  BlackjackTrainer
//
//  Created by Nicholas Fox on 3/30/14.
//  Copyright (c) 2014 Nicholas Fox. All rights reserved.
//

#import "GameViewController.h"
#import "BasicStrategy.h"
#import "Player.h"
#import "Dealer.h"
#import "Card.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.player = [Player alloc];
    self.dealer = [Dealer alloc];
    
    self.basicStrategy = [[BasicStrategy alloc] init];
    
    self.streak = 0;

    [self newHand];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)newHand {
    self.player = [self.player initNewHand];
    self.dealer = [self.dealer initNewHand];
    
    //set up player
    self.cardOneLabel.text = [(Card *)[self.player.hand objectAtIndex:0] cardLabel];
    self.cardOneImage.image = [(Card *)[self.player.hand objectAtIndex:0] image];
    self.cardTwoLabel.text = [(Card *)[self.player.hand objectAtIndex:1] cardLabel];
    self.cardTwoImage.image = [(Card *)[self.player.hand objectAtIndex:1] image];
    self.playerScoreLabel.text = [self.player getHandValueAsString];
    
    //set up dealer
    self.upCardLabel.text = [(Card *)[self.dealer.hand objectAtIndex:0] cardLabel];
    self.upCardImage.image = [(Card*)[self.dealer.hand objectAtIndex:0] image];
    self.dealerScoreLabel.text = [self.dealer getUpCardValueAsString];
    
    //set up streak
    self.streakLabel.text = [NSString stringWithFormat:@"%d", self.streak];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)checkAction:(id)action {
    

    self.action = [NSNumber numberWithInt:[action tag]];
    
    if ([self isCorrectAction]) {
        //positive feedback
        NSLog(@"Correct");
        
        //update streak
        self.streak++;
        
        //new game
        [self newHand];
    }
    else {
        //negative feedback
        NSLog(@"Incorrect");
        //reset streak
        self.streak=0;
        
        //new game
        [self newHand];
    }
}



#pragma mark Basic Strategy


- (BOOL)isCorrectAction {
    
    if ([self.player hasAce] && ![self.player hasDoubles]) {
        return [self.action isEqualToNumber:[self.basicStrategy checkAce:[self.player getHandValue] against:[self.dealer getUpCardValue]]];
    }
    else if ([self.player hasDoubles]) {
        return [self.action isEqualToNumber:[self.basicStrategy checkDoubles:[self.player getHandValue] against:[self.dealer getUpCardValue]]];
    }
    else {
        return [self.action isEqualToNumber:[self.basicStrategy checkNumber:[self.player getHandValue] against:[self.dealer getUpCardValue]]];
    }
}



@end
