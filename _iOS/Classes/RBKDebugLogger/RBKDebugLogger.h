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

#define RBKDebugLog(_category, _level, _message, ...) [[RBKDebugLogger sharedDebugLogger] logCategory:_category level:_level message:_message, ##__VA_ARGS__]

@interface RBKDebugLogger : NSObject

+ (RBKDebugLogger*)sharedDebugLogger;

@property (strong, nonatomic) RBKDebugSession *currentSession;
@property (assign, nonatomic) NSUInteger logPrintLevel;


- (void)logMessage:(NSString*)message, ...;
- (void)logLevel:(NSUInteger)level message:(NSString*)message, ...;
- (void)logCategory:(NSString*)category message:(NSString*)message, ...;
- (void)logCategory:(NSString*)category level:(NSUInteger)level message:(NSString*)message, ...;

@end
