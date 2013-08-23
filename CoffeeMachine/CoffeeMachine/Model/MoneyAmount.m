//
//  MoneyAmount.m
//  PickerViewTest
//
//  Created by dancho on 8/12/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import "MoneyAmount.h"
#import "Coin.h"
#import "Withdraw.h"

@implementation MoneyAmount
@synthesize coins;
-(id)init
{
    self = [super init];
    if (self) {
    self.coins = [NSMutableDictionary dictionary];
    }
    return self;
}




-(MoneyAmount *)add:(Coin *)c : (int)count {
    
    NSMutableArray *amount = [[NSMutableArray alloc]init];
    [amount addObject:[NSNumber numberWithInteger:count]];
    NSMutableArray *coin = [[NSMutableArray alloc]initWithObjects:c, nil];
    coins=[[NSMutableDictionary alloc]initWithObjects:amount forKeys:coin];
    
    return self;
}
-(MoneyAmount *)add:(MoneyAmount*)mAmount {
    
    return self;
}


- (void)addCoin:(Coin *)coin amount:(NSUInteger)amount
{
    BOOL coinFound = NO;
    for (Coin *storedCoin in [self.coins allKeys]) {
        if ([storedCoin isEqual:coin]) {
            coinFound = YES;
            [self.coins setObject:@(amount + [self.coins[storedCoin] intValue]) forKey:storedCoin];
            break;
        }
    }
    
    if (!coinFound) {
        [self.coins setObject:@(amount) forKey:coin];
    }
}



-(NSMutableArray*)getSortedCoinTypes{
    
    NSMutableArray *availableCoinTypes = [[NSMutableArray alloc]init];
    [availableCoinTypes sortedArrayUsingSelector:@selector(integerValue:)];
    return availableCoinTypes;
    
}

-(Withdraw *)withdraw:(int)amount {
    MoneyAmount *requestedCoins = [[MoneyAmount alloc]init];
    if ( amount < 0 ){
        
    }
    if (amount == 0) {
        WithdrawRequestResultStatus req = SUCCESSFUL;
        Withdraw *withdraw = [[Withdraw alloc]init] ;
        [ withdraw StatusAndChange:req : requestedCoins];
        return withdraw;
        
    }
    Coin* coin=[[Coin alloc]init];
    NSArray* sortedCoins=[[NSArray alloc]init];
    sortedCoins=[self getSortedCoinTypes];
    for(int i=0;i<[sortedCoins count];i++){
        if (amount > 0 && (amount - coin.value >= 0)){
            coin=[sortedCoins objectAtIndex:i];
            int possibleCoinsToGet = amount / coin.value;
            int totalAvailFromThisType = [self.coins[coin] intValue];
            
            if (totalAvailFromThisType >= possibleCoinsToGet) {
                [requestedCoins add:coin :possibleCoinsToGet];
                [self getCoins:coin :possibleCoinsToGet];
                amount-=coin.value*possibleCoinsToGet;
                
            } else if(totalAvailFromThisType < possibleCoinsToGet){
                [requestedCoins add:coin :totalAvailFromThisType];
                [self getCoins:coin :totalAvailFromThisType];
                amount -= coin.value * totalAvailFromThisType;
            }
        }
        
    }
    
    if (amount==0) {
        Withdraw* withdraw=[[Withdraw alloc]init];
        withdraw=[withdraw StatusAndChange:SUCCESSFUL:requestedCoins ];
        return withdraw;
    }
    Withdraw* withdraw=[[Withdraw alloc]init];
    withdraw=[withdraw StatusAndChange:INSUFFICIENT_AMOUNT:requestedCoins ];
    return withdraw;
    
}
-(void)getCoins:(Coin *)coin :(int)count{
    int availableCoins=[self.coins[coin] intValue];
    if(availableCoins < count){
        
    }
    int totalCount = availableCoins - count;
    return [coins setObject:[NSNumber numberWithInteger:totalCount] forKey:(id)coin];
}

-(NSString*)description {
       return [NSString stringWithFormat:@"coin: %@", self.coins];
}

-(int)sumOfCoins
{
    int amount=0;
    for (Coin *coin in [self.coins allKeys]) {
        amount+=coin.value;
    }
    return amount;
}


-(void)setSomeCoins
{   Coin* coinFive = [[Coin alloc]init];
    coinFive.value=5;
    Coin* coinTen = [[Coin alloc]init];
    coinTen.value=10;
    Coin* coinTwenty = [[Coin alloc]init];
    coinTwenty.value=20;
    Coin* coinFifty  = [[Coin alloc]init];
    coinFifty.value=50;
    Coin* coinLev = [[Coin alloc]init];


    coinLev.value=100;


    [self addCoin:coinFive amount:10];
    [self addCoin:coinTen amount:10];
    [self addCoin:coinTwenty amount:10];
    [self addCoin:coinFifty amount:10];
    [self addCoin:coinLev amount:10];
    
    
}


/*-(NSUInteger*)hashCode
{
    return [coins hash];
}
-(BOOL)equals:(id)obj
{
    if([self equals:obj])
        return TRUE;
    if(obj==nil)
        return FALSE;
    if([self class]!=[obj class])
        return FALSE;
    MoneyAmount* other=[[MoneyAmount alloc]init];
    other=(id)obj;
    if([coins isEqual:[other getCoins]])
        return FALSE;
    return TRUE;
}

*/

@end
