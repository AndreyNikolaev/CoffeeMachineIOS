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
@end
