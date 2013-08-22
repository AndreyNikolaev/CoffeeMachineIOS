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
@interface PaymentFlow ()

@end

@implementation PaymentFlow
@synthesize chosenItemLabel;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchBack:(id)sender {
    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController"bundle:nil ];
    //[self presentViewController:vc animated:YES completion:nil];
    [[self navigationController ]setNavigationBarHidden:NO animated:YES];
    
    //    pf.title = itemsArray[indexPath.row];
    //vc.sizes = @[@"Small", @"Medium", @"Large", @"Extra Large"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sumFive:(id)sender {
   // [ self checkTheSum];
    //sumLbl.text;
    sum+=5;
    result= [NSString stringWithFormat:@"%d", sum];
    
    sumLbl.text=result;

}

- (IBAction)sumTen:(id)sender {
   sum+=10;
    result= [NSString stringWithFormat:@"%d", sum];
    
    sumLbl.text=result;
    
    
    Coin *coin = [[Coin alloc]init];
    [coin setValue:10];
   // NSArray *coinsArr = [[NSArray alloc]initWithObjects:coin, nil ];
    int amount = 10;
//NSArray *amountsArr =[[NSArray alloc]initWithObjects:[NSNumber numberWithInteger:amount], nil];
    MoneyAmount *mAmount = [[MoneyAmount alloc]init];
    //NSlog(@" %@ ",test);
    [mAmount add:coin:amount];
    //sumLbl.text = [mAmount toString];
    
    /*DrinksContainer* drContainer=[[DrinksContainer alloc]init];
    [drContainer setSomeDrinks];
    NSMutableArray* drinks=[[NSMutableArray alloc]init];
    drinks=[drContainer getStringDrinks];
    NSUInteger* countOfDrinks = [drinks count ];
    NSLog(@"Count of drinks ",[NSString stringWithFormat:@"%d",countOfDrinks]);
    for (int i=0; i<drinks.count; i++) {
        NSLog(@"%@",[drinks objectAtIndex:i]);
     */
//}
    

}

- (IBAction)sumTwenty:(id)sender {
    sum+=20;
    result= [NSString stringWithFormat:@"%d", sum];
    
    sumLbl.text=result;
}

- (IBAction)sumFifty:(id)sender {
    sum+=50;
    result= [NSString stringWithFormat:@"%d", sum];
    
    sumLbl.text=result;
    
}

- (IBAction)sumLev:(id)sender {
    sum+=100;
    result= [NSString stringWithFormat:@"%d", sum];
    
    sumLbl.text=result;
}
- (void) checkTheSum {
    if(sum > 0){
        ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
@end
