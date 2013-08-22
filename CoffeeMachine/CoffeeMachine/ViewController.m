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


@interface ViewController ()

@end



@implementation ViewController

@synthesize itemsArray = _itemsArray;
@synthesize tableView = _tableView;

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.title = @"Coffee Machine";
    
    DrinksContainer *drinks =[[ DrinksContainer alloc]init ];
    drinks.setSomeDrinks;
    CoffeeMachineState* coffeeMachineState=[[CoffeeMachineState alloc]init];
    [coffeeMachineState setCurrentDrinksAmount:drinks];
    
  
    _itemsArray=[[NSMutableArray alloc]initWithArray:[[coffeeMachineState getCurrentDrinks] getStringDrinks]];
   	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)switchView:(id)sender {
   // PaymentFlow *pf = [[PaymentFlow alloc] initWithNibName:@"PaymentFlow" bundle:nil];
    //[self presentViewController:pf animated:YES completion:nil];
    
//}

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
    //NSString *string1=@"Coffee";
    //itemsArray = [NSMutableArray arrayWithObjects:@"Coffee",@"Tea", @"Hot chocolate",nil];
    
    
    NSUInteger count = [_itemsArray count];
    for (NSUInteger i = 0; i < count; i++) {
        if(indexPath.row==i){
            
            NSString *current = [_itemsArray objectAtIndex: i];
            cell.textLabel.text=current;
        }
    }
    
    //int x=10;
    //cell.textLabel.text=[string1 stringByAppendingFormat:@" - %d ",x];return cell;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // int row = indexPath.row;
   // UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
   // NSString *cellText = selectedCell.textLabel.text;
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PaymentFlow *pf = [[PaymentFlow alloc] init];
    pf.title = _itemsArray[indexPath.row];

    //vc.sizes = @[@"Small", @"Medium", @"Large", @"Extra Large"];
    [self.navigationController pushViewController:pf animated:YES];

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    
}



@end