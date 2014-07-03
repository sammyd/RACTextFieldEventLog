//
//  SCViewController.m
//  RACTextFieldEventLog
//
//  Created by Sam Davies on 03/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import "SCViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SCEventTableViewController.h"

@interface SCViewController ()

@property (nonatomic, strong) SCEventTableViewController *eventsTableVC;

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
        if([vc isKindOfClass:[SCEventTableViewController class]]) {
            self.eventsTableVC = (SCEventTableViewController*)vc;
        }
    }];
    
    
    [self.textField.rac_textSignal
    subscribeNext:^(NSString *payload) {
        [self.eventsTableVC postNewEventWithPayload:payload];
    }];
}

@end
