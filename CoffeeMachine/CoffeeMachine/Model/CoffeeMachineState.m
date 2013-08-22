//
//  CoffeeMachineState.m
//  CoffeeX
//
//  Created by System Administrator on 8/13/13.
//  Copyright (c) 2013 System Administrator. All rights reserved.
//

#import "CoffeeMachineState.h"
#import "DrinksContainer.h"

@implementation CoffeeMachineState
@synthesize currentDrinksAmount;
@synthesize initialDrinksAmount;
@synthesize coins;

-(id)init:(MoneyAmount*) newCoins : (DrinksContainer*) newDrinks
{
    self = [super init];
    if (self) {
        coins=newCoins;
        currentDrinksAmount=newDrinks;
        initialDrinksAmount=[[DrinksContainer alloc]init ];
        NSMutableArray* currentDrinks=[[NSMutableArray alloc]initWithArray:[currentDrinksAmount getDrinks]];
        for(int i=0;i<[currentDrinks count];i++){
           // [initialDrinksAmount addDrink:<#(Drink *)#> quantity:<#(NSUInteger)#>:[currentDrinks objectAtIndex:i]];
        }
        [initialDrinksAmount commit];
        
    }
    return self;
}
-(MoneyAmount*)getCoins
{
    return coins;
}
-(DrinksContainer*)getCurrentDrinks
{
    return currentDrinksAmount;
}
-(DrinksContainer*)getInitialDrinks
{
    return initialDrinksAmount;
}
-(void)setCoins:(MoneyAmount*)newCoins
{
    coins=newCoins;
}
-(NSMutableDictionary*)getFiltratedDrinks
{
    NSMutableDictionary* currentDrinks=[[NSMutableDictionary alloc]initWithDictionary:currentDrinksAmount.drinks];
   // NSMutableDictionary* filtratedDrinks=[[NSMutableDictionary alloc]init];
    
    for (Drink *storedDrink in [currentDrinks allKeys]) {
        if ([currentDrinks[storedDrink]integerValue] == 0) {
            [currentDrinks removeObjectForKey:storedDrink];
       // }else {
           // [filtratedDrinks setObject:@([currentDrinks[storedDrink]integerValue]) forKey:storedDrink];
        }
    }

    
    
    return currentDrinks;
}
@end
