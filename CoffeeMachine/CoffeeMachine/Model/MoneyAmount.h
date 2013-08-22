//
//  MoneyAmount.h
//  PickerViewTest
//
//  Created by dancho on 8/12/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coin.h"

@class Withdraw;

@interface MoneyAmount : NSObject<NSCopying>
@property NSMutableDictionary * coins;
-(id)init;
-(NSMutableDictionary *)getCoins;
-(MoneyAmount *)add:(Coin*) c : (int) count;
-(MoneyAmount *)add:(MoneyAmount*)mAmount;
-(Withdraw *)withdraw:(int)amount;
-(NSMutableArray *)getSortedCoinTypes;
-(void)getCoins:(Coin *)c : (int)count;
-(int)getCoin:(Coin *)c;
-(NSString *)toString;
-(int)sumOfCoins;
-(NSUInteger*)hashCode;
-(BOOL)equals:(id)obj;

@end
