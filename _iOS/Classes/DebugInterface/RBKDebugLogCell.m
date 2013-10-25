//
//  RBKDebugLogCell.m
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-25.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import "RBKDebugLogCell.h"

@interface RBKDebugLogCell()

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel, *levelLabel, *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

@end

@implementation RBKDebugLogCell

- (void)updateWithLog:(RBKLogMessage*)log {
    self.categoryLabel.text = log.category;
    self.levelLabel.text = [NSString stringWithFormat:@"%@", log.level];
    self.dateLabel.text = [NSString stringWithFormat:@"%@", log.timestamp];
    self.messageTextView.text = log.message;
}

@end
