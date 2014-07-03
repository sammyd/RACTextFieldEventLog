//
//  SCEventTableViewController.h
//  RACTextFieldEventLog
//
//  Created by Sam Davies on 03/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCEventTableViewController : UITableViewController

- (void)postNewEventWithPayload:(NSString *)payload;

@end
