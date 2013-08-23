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
#import "Withdraw.h"
#import "Coin.h"
#import"MoneyAmount.h"
#import "Withdraw.h"
#import "CoffeeMachineState.h"
#import "Drink.h"
#import "OrderFinalizeFlow.h"
#import "InsufficientAmountFlow.h"
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
 
    [self setCoinInUserCoins:5];
    [self checkTheSum];
}

- (IBAction)sumTen:(id)sender {
    
   [self setCoinInUserCoins:10];
    [self checkTheSum];
}

- (IBAction)sumTwenty:(id)sender {
        
   [self setCoinInUserCoins:20];
    [self checkTheSum];
}

- (IBAction)sumFifty:(id)sender {
   [self setCoinInUserCoins:50];
   [self checkTheSum];
}

- (IBAction)sumLev:(id)sender {
    [self setCoinInUserCoins:100];
    [self checkTheSum];
}

- (void) checkTheSum {
    if( userCoins.sumOfCoins > selectedDrink.price){
        
        if([[coffeeMachineState.coins withdraw:[[userCoins sumOfCoins]-selectedDrink.price]]==SUCCESSFUL){
            OrderFinalizeFlow *orderFinalizeFlow=[[OrderFinalizeFlow alloc]init];
            [self presentViewController:orderFinalizeFlow animated:YES completion:nil];
        }
        else{
            InsufficientAmountFlow *insAmountFlow=[[InsufficientAmountFlow alloc]initWithNibName:@"InsufficientAmountFlow" bundle:nil];
            [self presentViewController:insAmountFlow animated:YES completion:nil];
        }
        
       // ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        //[self presentViewController:vc animated:YES completion:nil];
    }
}
@end
