//
//  SCEventTableViewController.m
//  RACTextFieldEventLog
//
//  Created by Sam Davies on 03/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import "SCEventTableViewController.h"
#import "SCEventTableViewCell.h"

@interface SCEventTableViewController ()

@property (nonatomic, strong) NSMutableArray *eventArray;
@property (nonatomic, assign) BOOL shouldHighlightFirstRow;

@end


@implementation SCEventTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.eventArray = [NSMutableArray array];
    self.shouldHighlightFirstRow = NO;
}

#pragma mark - API Methods
- (void)postNewEventWithPayload:(NSString *)payload
{
    [self.eventArray insertObject:payload atIndex:0];
    self.shouldHighlightFirstRow = YES;
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
    
}


#pragma mark - <UITableViewDatasource>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    
    if([cell isKindOfClass:[SCEventTableViewCell class]]) {
        SCEventTableViewCell *eventCell = (SCEventTableViewCell*)cell;
        [eventCell setEventPayload:self.eventArray[indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 && self.shouldHighlightFirstRow) {
        if([cell isKindOfClass:[SCEventTableViewCell class]]) {
            SCEventTableViewCell *eventCell = (SCEventTableViewCell*)cell;
            [eventCell animateAppearance];
        }
        self.shouldHighlightFirstRow = NO;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eventArray count];
}

@end
