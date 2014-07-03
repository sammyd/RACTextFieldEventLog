//
//  SCEventTableViewCell.m
//  RACTextFieldEventLog
//
//  Created by Sam Davies on 03/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import "SCEventTableViewCell.h"

@implementation SCEventTableViewCell


- (void)setEventPayload:(NSString *)payload
{
    self.textLabel.text = payload;
}

- (void)animateAppearance
{
    self.backgroundColor = [UIColor redColor];
    [UIView animateWithDuration:1 animations:^{
        self.backgroundColor = [UIColor whiteColor];
    }];
}

@end
