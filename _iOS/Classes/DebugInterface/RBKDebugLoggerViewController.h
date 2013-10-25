//
//  RBKDebugLoggerViewController.h
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-25.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RBKDebugLoggerViewController;

@protocol RBKDebugLoggerViewControllerDelegate<NSObject>

@optional
//If no delegate is set, when the close button is tapped, it will just dismiss itself. However,
//should other behaviour be desired, a delegate can be set and this method implemented.
- (void)debugLoggerViewControllerDidTapClose:(RBKDebugLoggerViewController*)viewController;

@end

@interface RBKDebugLoggerViewController : UIViewController


@property (weak, nonatomic) id<RBKDebugLoggerViewControllerDelegate> delegate;


@end
