//
//  PaymentFlow.h
//  PickerViewTest
//
//  Created by dancho on 8/6/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import <UIKit/UIKit.h>

int sum;
NSString *result;
@interface PaymentFlow : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *chosenItemLabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelBtn;
- (IBAction)switchBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *fiveBtn;
@property (strong, nonatomic) IBOutlet UILabel *sumLbl;
@property (strong, nonatomic) IBOutlet UIButton *tenBtn;
@property (strong, nonatomic) IBOutlet UIButton *twentyBtn;
@property (strong, nonatomic) IBOutlet UIButton *fiftyBtn;
@property (strong, nonatomic) IBOutlet UIButton *levBtn;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;

- (IBAction)sumFive:(id)sender;
- (IBAction)sumTen:(id)sender;
- (IBAction)sumTwenty:(id)sender;
- (IBAction)sumFifty:(id)sender;
- (IBAction)sumLev:(id)sender;

@end