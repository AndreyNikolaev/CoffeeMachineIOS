//
//  AdministrationFlow.m
//  CoffeeMachine
//
//  Created by dancho on 8/27/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import "AdministrationFlow.h"
#import "ViewController.h"

@interface AdministrationFlow ()
@end
@implementation AdministrationFlow

@synthesize navigationBar;
@synthesize tableView;
@synthesize moneyAmount;
@synthesize drinksSold;

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
    self.title=@"Administrator report";
    self.navigationBar.backBarButtonItem.title=@"Coffee Machine";
    self.tableView.tableHeaderView=[[UIView alloc]init];
    // Do any additional setup after loading the view from its nib.
    
    DrinksContainer *soldDrinks =[[ DrinksContainer alloc]init ];
    [soldDrinks setSomeDrinks];
    MoneyAmount *mAmount = [[MoneyAmount alloc]init];
    [mAmount setSomeCoins];

   // self.moneyAmount = [[NSMutableArray alloc]initWithArray:mAmount.description];
    self.drinksSold = [[NSMutableArray alloc]initWithArray:soldDrinks.drinkNameAndQuantityToString];
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


- (NSInteger)numberOfSectionsInTableView :(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell" ];
    }
    NSUInteger count = [self.drinksSold count];
    for (NSUInteger i = 0; i < count; i++) {
        if(indexPath.row==i){
            
            NSString *current = [self.drinksSold objectAtIndex: i];
            cell.textLabel.text=current;
        }
    }return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
            
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Drinks";
    }else{
        return @"Coins";
    }
}
@end
