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
-(id)init
{
    self = [super init];
    if (self) {
        Coin *c = [[Coin alloc]init];
        [c setValue:5];
        NSMutableArray *amount = [[NSMutableArray alloc]init];
        [amount addObject:[NSNumber numberWithInteger:10]];
        NSMutableArray *coin = [[NSMutableArray alloc]initWithObjects:c, nil];
        coins=[[NSMutableDictionary alloc]initWithObjects:amount forKeys:coin];
    }
    return self;
}
-(NSDictionary *)getCoins {
    return coins;
}

-(int)getCoin:(Coin *)c{
    return  [coins valueForKey:(id)c];
}

-(MoneyAmount *)add:(Coin *)c : (int)count {
    
   // int totalCount = [ coins objectForKey:c ];
   // int total  =  totalCount + count;
   //[coins setObject:[NSNumber numberWithInteger:count] forKey:(id)c];
    //Coin *c = [[Coin alloc]init];
    //[c setValue:5];
    NSMutableArray *amount = [[NSMutableArray alloc]init];
    [amount addObject:[NSNumber numberWithInteger:count]];
    NSMutableArray *coin = [[NSMutableArray alloc]initWithObjects:c, nil];
    coins=[[NSMutableDictionary alloc]initWithObjects:amount forKeys:coin];
    
    return self;
}
-(MoneyAmount *)add:(MoneyAmount*)mAmount {
    
    return self;
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
            int totalAvailFromThisType = [self getCoin:coin];
            
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
        WithdrawRequestResultStatus* status=SUCCESSFUL;
        withdraw=[withdraw StatusAndChange:status:requestedCoins ];
        return withdraw;
    }
    Withdraw* withdraw=[[Withdraw alloc]init];
    WithdrawRequestResultStatus* status=INSUFFICIENT_AMOUNT;
    //ßwithdraw=[withdraw StatusAndChange:status:requestedCoins ];
    return withdraw;
    
}
-(void)getCoins:(Coin *)c :(int)count{
    int availableCoins=[self getCoin:c];
    if(availableCoins < count){
        
    }
    int totalCount = availableCoins - count;
    return [self.coins setObject:[NSNumber numberWithInteger:totalCount] forKey:(id)c];
}

-(NSString*)toString {
    NSString *stringOfCoins=[[NSString alloc]init];
    NSArray* values=[[NSArray alloc]init];
    NSArray* keys=[[NSArray alloc]init];
    keys=[self.coins allKeys ];
    values=[coins allValues];
    Coin* coin=[[Coin alloc]init];
    id key;
    for(int i=0;i<[coins count];i++)
    {   coin=[keys objectAtIndex:i];
        key=[values objectAtIndex:i];
        stringOfCoins=[stringOfCoins stringByAppendingFormat:@"%@", coin];
        stringOfCoins=[stringOfCoins stringByAppendingString:@"   - "];
        stringOfCoins=[stringOfCoins stringByAppendingString:[NSString stringWithFormat:@"%@",key]];
    }
    return stringOfCoins;
    
    
}

-(int)sumOfCoins
{
    int amount=0;
    Coin* coin=[[Coin alloc]init];
    for(int i=0;i<[coins count];i++){
        amount=[self getCoin:coin]*coin.value;
        
    }
    return amount;
}
-(NSUInteger*)hashCode
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



@end
