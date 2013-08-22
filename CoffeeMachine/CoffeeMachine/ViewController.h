//
//  ViewController.h
//  PickerViewTest
//
//  Created by dancho on 8/6/13.
//  Copyright (c) 2013 graci. All rights reserved.
//

#import <UIKit/UIKit.h>

NSInteger globalPrice;

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic) NSMutableArray *itemsArray;

@end
