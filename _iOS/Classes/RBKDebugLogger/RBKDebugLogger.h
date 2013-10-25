//
//  RBKDebugLogger.h
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-10.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBKDebugSession.h"
#import "RBKLogMessage.h"

/**
 *  Convenience enum provides a potential
 *  specification for RBK debug levels.
 *  RBK Debug logger will take any NSUInteger
 *  so you may provide your own if these
 *  values do not provide enough flexibility.
 */
typedef NS_ENUM(NSUInteger, RBKDebugLevel) {
    RBKDebugLevelMessage = 0,
    RBKDebugLevelWarningLow,
    RBKDebugLevelWarningHigh,
    RBKDebugLevelError,
    RBKDebugLevelCritical
};

#define RBKDebugLog(_message, _category, _level) [[RBKDebugLogger sharedDebugLogger] logMessage:_message category:_category level:_level]



@interface RBKDebugLogger : NSObject

+ (RBKDebugLogger*)sharedDebugLogger;

@property (strong, nonatomic) RBKDebugSession *currentSession;
@property (assign, nonatomic) NSUInteger logPrintLevel;

- (void)logWithCategory:(NSString*)category level:(NSUInteger)level message:(NSString*)message, ... NS_FORMAT_FUNCTION(3,4);
- (void)logMessage:(NSString*)message category:(NSString*)category level:(NSUInteger)level;

@end
