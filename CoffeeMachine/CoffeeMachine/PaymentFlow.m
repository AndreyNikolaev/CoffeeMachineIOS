//
//  PaymentFlow.m
//  PickerViewTest
//
//  Created by dancho on 8/6/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import "PaymentFlow.h"
#import "ViewController.h"
#import "DrinksContainer.h"

#import "Coin.h"
#import"MoneyAmount.h"
#import "Withdraw.h"
#import "CoffeeMachineState.h"
#import "Drink.h"
@interface PaymentFlow ()

@end

@implementation PaymentFlow

@synthesize coffeeMachineState;
@synthesize selectedDrink;
@synthesize userCoins;

@synthesize sumLbl;
@synthesize fiveBtn;
@synthesize tenBtn;
@synthesize twentyBtn;
@synthesize fiftyBtn;
@synthesize levBtn;
 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    sum = 0;
    userCoins=[[MoneyAmount alloc]init];
    // Do any additional setup after loading the view from its nib.
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchBack:(id)sender {
    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController"bundle:nil ];
    [[self navigationController ]setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setCoinInUserCoins:(int)coinValue
{
    Coin *userCoin=[[Coin alloc]init];
    userCoin.value=coinValue;
    [self.userCoins addCoin:userCoin amount:1];
    sumLbl.text=[NSString stringWithFormat:@"%d",[self.userCoins sumOfCoins]];
}
- (IBAction)sumFive:(id)sender {
    Coin *userCoin=[[Coin alloc]init];
    userCoin.value=5;
    [userCoins addCoin:userCoin amount:1];
    sumLbl.text=result;

    [self setCoinInUserCoins:5];

}

- (IBAction)sumTen:(id)sender {
    
   [self setCoinInUserCoins:10];
    
}

- (IBAction)sumTwenty:(id)sender {
    
    sum+=20;
    result= [NSString stringWithFormat:@"%d", sum];
    
    sumLbl.text=result;
    
   [self setCoinInUserCoins:20];
    [self checkTheSum];
}

- (IBAction)sumFifty:(id)sender {
   [self setCoinInUserCoins:50];
    
}

- (IBAction)sumLev:(id)sender {
    [self setCoinInUserCoins:100];}

- (void) checkTheSum {
    if( userCoins.sumOfCoins > selectedDrink.price){
        ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
@end
