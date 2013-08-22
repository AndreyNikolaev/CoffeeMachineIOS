//
//  DrinksContainer.m
//  CoffeeMachine
//
//  Created by System Administrator on 8/6/13.
//  Copyright (c) 2013 System Administrator. All rights reserved.
//

#import "DrinksContainer.h"
#import "Drink.h"

@implementation DrinksContainer

@synthesize additionClosed = isAdditionClosed;

-(id)init
{
    self = [super init];
    if (self) {
        self.drinks = [NSMutableDictionary dictionary];
        self.additionClosed = NO;
    }
    return self;
}

- (void)addDrink:(Drink *)drink quantity:(NSUInteger)quantity
{
    BOOL drinkFound = NO;
    for (Drink *storedDrink in [self.drinks allKeys]) {
        if ([storedDrink isEqual:drink]) {
            drinkFound = YES;
            [self.drinks setObject:@(quantity + [self.drinks[storedDrink] intValue]) forKey:storedDrink];
            break;
        }
    }
    
    if (!drinkFound) {
        [self.drinks setObject:@(quantity) forKey:drink];
    }
}



-(BOOL)isAdditionClosed
{
    return self.additionClosed;
}
-(NSMutableDictionary*)getDrinks
{
    return self.drinks;
}

-(NSMutableArray*)getStringDrinks
{
    NSMutableArray* stringOfDrinksArray=[[NSMutableArray alloc]init];
    
    for (Drink *storedDrink in [self.drinks allKeys]) {
        [stringOfDrinksArray addObject:[NSString stringWithFormat:@"%@  price: %lu",storedDrink.name,(unsigned long)storedDrink.price]];
    }

    return stringOfDrinksArray;
}

-(void)setSomeDrinks 
{
    Drink* drink1;
    Drink* drink2;
    drink1 = [[Drink alloc]init];
    drink2 = [[Drink alloc]init];
    drink1.name=@"Coffee";
    drink1.price=30;
    drink2.name=@"Tea";
    [self addDrink:drink1 quantity:100];
    [self addDrink:drink2 quantity:100];
    
    
}

-(DrinksContainer*)commit
{
    self.additionClosed=YES;
    return self;
}

-(NSUInteger*)getDrinkQuantity:(Drink *)searchedDrink
{
    NSUInteger* quantity=0;
    
    for (Drink *storedDrink in [self.drinks allKeys]) {
        if ([searchedDrink.name isEqualToString:storedDrink.name]) {
            quantity = (unsigned)[self.drinks valueForKey:storedDrink.name];
            break;
        }
    }

    
        return quantity;
}

-(void)decreaseDrinkAmount:(Drink *)selectedDrink
{
    for (Drink *storedDrink in [self.drinks allKeys]) {
        if ([selectedDrink.name isEqualToString:storedDrink.name]) {
            [self.drinks setObject:@([self.drinks[storedDrink] intValue]-1) forKey:storedDrink];
            break;
        }
    }
}
@end
