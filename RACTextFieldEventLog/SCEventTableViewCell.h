//
//  SCEventTableViewCell.h
//  RACTextFieldEventLog
//
//  Created by Sam Davies on 03/07/2014.
//  Copyright (c) 2014 ShinobiControls. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCEventTableViewCell : UITableViewCell

- (void)setEventPayload:(NSDictionary *)payload;
- (void)animateAppearance;

@end
