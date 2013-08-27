//
//  ViewController.m
//  PickerViewTest
//
//  Created by dancho on 8/6/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import "ViewController.h"
#import "PaymentFlow.h"
#import "Drink.h"
#import "DrinksContainer.h"
#import "CoffeeMachineState.h"
#import "MoneyAmount.h"


@interface ViewController ()

@end



@implementation ViewController

@synthesize itemsArray = _itemsArray;
@synthesize tableView = _tableView;
@synthesize coffeeMachineState=_coffeeMachineState;


#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.title = @"Coffee Machine";
    UIBarButtonItem *adminButton = [[UIBarButtonItem alloc] initWithTitle:@"Admin" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.rightBarButtonItem = adminButton;
    
    DrinksContainer *drinks =[[ DrinksContainer alloc]init ];
    [drinks setSomeDrinks];
    MoneyAmount *moneyAmount = [[MoneyAmount alloc]init];
    [moneyAmount setSomeCoins];
    _coffeeMachineState=[[CoffeeMachineState alloc]init];
    [_coffeeMachineState setCurrentDrinksAmount:drinks];
    _coffeeMachineState.coins = moneyAmount;
    
  
    _itemsArray=[[NSMutableArray alloc]initWithArray:[[_coffeeMachineState getCurrentDrinks] getStringDrinks]];
   
   	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark === UITableView data source & delegate ===

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemsArray.count;
}
- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell" ];
    }
        
    NSUInteger count = [_itemsArray count];
    for (NSUInteger i = 0; i < count; i++) {
        if(indexPath.row==i){
            
            NSString *current = [_itemsArray objectAtIndex: i];
            cell.textLabel.text=current;
        }
    }



    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    DrinksContainer* tempDrinkContainer=[[DrinksContainer alloc]init];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PaymentFlow *paymentFlow = [[PaymentFlow alloc] init];
    paymentFlow.coffeeMachineState=_coffeeMachineState;


    paymentFlow.title = _itemsArray[indexPath.row];

   
    

    paymentFlow.title = _itemsArray[indexPath.row];
    tempDrinkContainer=_coffeeMachineState.currentDrinksAmount;
    NSArray* tempDrinksArray=[[NSArray alloc]initWithArray:[tempDrinkContainer getDrinks]];
    paymentFlow.selectedDrink=[tempDrinksArray objectAtIndex:indexPath.row];



    [self.navigationController pushViewController:paymentFlow animated:YES];

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    
}



@end
