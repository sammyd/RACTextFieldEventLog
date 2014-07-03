//
//  SCEventTableViewCell.m
//  RACTextFieldEventLog
//
//  Created by Sam Davies on 03/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import "SCEventTableViewCell.h"

@implementation SCEventTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)setEventPayload:(NSDictionary *)payload
{
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateStyle = NSDateFormatterNoStyle;
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    });
    
    self.textLabel.text = [dateFormatter stringFromDate:payload[@"timestamp"]];
    self.detailTextLabel.text = payload[@"content"];
}

- (void)animateAppearance
{
    self.backgroundColor = [UIColor redColor];
    [UIView animateWithDuration:2 animations:^{
        self.backgroundColor = [UIColor whiteColor];
    }];
}

@end
