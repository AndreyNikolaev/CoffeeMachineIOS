//
//  InsufficientAmountFlow.h
//  PickerViewTest
//
//  Created by dancho on 8/21/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsufficientAmountFlow : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *makeDrinkBtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelOrderBtn;
- (IBAction)switchToFinalizeFlow:(id)sender;
- (IBAction)switchToDrinkListFlow:(id)sender;

@end
