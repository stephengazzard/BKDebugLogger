//
//  RBKDebugLogCell.h
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-25.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBKLogMessage.h"

@interface RBKDebugLogCell : UITableViewCell

- (void)updateWithLog:(RBKLogMessage*)log;

@end
