//
//  Coin.h
//  PickerViewTest
//
//  Created by dancho on 8/7/13.
//  Copyright (c) 2013 graci. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef enum {
    FIVE,
    TEN,
    TWENTY,
    FIFTY,
    LEV100
    
} CoinValue;

@interface Coin : NSObject

@property int value;
@property CoinValue coinValue;

@end