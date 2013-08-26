//
//  InsufficientAmountFlow.m
//  PickerViewTest
//
//  Created by dancho on 8/21/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import "InsufficientAmountFlow.h"
#import "OrderFinalizeFlow.h"
#import "ViewController.h"

@interface InsufficientAmountFlow ()

@end

@implementation InsufficientAmountFlow

@synthesize selectedDrink;
@synthesize coffeeMachineState;
@synthesize change;
@synthesize cancelOrderBtn;
@synthesize makeDrinkBtn;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchToFinalizeFlow:(id)sender {
    
    OrderFinalizeFlow *orderFinalizeFlow = [[OrderFinalizeFlow alloc]initWithNibName:@"OrderFinalizeFlow" bundle:nil];
orderFinalizeFlow.coffeeMachineState =self.coffeeMachineState;
   orderFinalizeFlow.selectedDrink = self.selectedDrink;
   orderFinalizeFlow.change = self.change;
    [self presentViewController: orderFinalizeFlow animated:YES completion:nil];
}

- (IBAction)switchToDrinkListFlow:(id)sender {
    ViewController *drinkListFlow = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    //drinkListFlow.title = @"Coffee Machine";
    [self presentViewController:drinkListFlow animated:YES completion:nil];
    
}



@end











