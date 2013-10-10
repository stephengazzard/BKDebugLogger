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

/**
 *  Convenience macro allows C-Style debugging.
 *  By default requires a category and a level.
 *  To log without requiring a category or a
 *  level, use RBKDebugLogSimple.
 *  To log without requiring a level but with
 *  a category, use RBKDebugLogCategory.
 *  To log without requiring a category but with
 *  a level, use RBKDebugLogLevel.
 *  Note that it is highly recommended that you
 *  provide a category to all debug messages.
 *  Equivalent to calling 
 *  [[RBKDebugLogger sharedDebugLogger]
 *      logMessage:<message> category:<category> level:<level>];
 */
#define RBKDebugLog(message, category, level) [[RBKDebugLogger sharedDebugLogger] logMessage:message category:category level:level]

/**
 *  Convenience macro allows C-Style debugging.
 *  Will default to a debug level of 0.
 *  Equivalent to calling 
 *  [[RBKDebugLogger sharedDebugLogger]
 *      logMessage:<message> category:<category>];
 */
#define RBKDebugLogCategory(message, category) [[RBKDebugLogger sharedDebugLogger] logMessage:message category:category level:RBKDebugLevelMessage]

/**
 *  Convenience macro allows C-Style debugging.
 *  Will default to nil category.
 *  Equivalent to calling
 *  [[RBKDebugLogger sharedDebugLogger]
 *      logMessage:<message> level:<level>];
 */
#define RBKDebugLogLevel(message, level) [[RBKDebugLogger sharedDebugLogger] logMessage:message category:nil level:level]

/**
 *  Convenience macro allows C-Style debugging.
 *  Defaults to no category and 0 (neutral) level.
 *  Equivalent to calling
 *  [[RBKDebugLogger sharedDebugLogger]
 *      logMessage:<message>];
 */
#define RBKDebugLogSimple(message) [[RBKDebugLogger sharedDebugLogger] logMessage:message category:nil level:RBKDebugLevelMessage]

@interface RBKDebugLogger : NSObject

+ (RBKDebugLogger*)sharedDebugLogger;

/**
 *  The current session.
 *  Each log will store a reference to the
 *  session where it was logged.
 */
@property (strong, nonatomic) RBKDebugSession *currentSession;

/**
 *  Logs a message with no category or level
 *  specified. Defaults to nil category and
 *  0 level message.
 */
- (void)logMessage:(NSString*)message;

/**
 *  Logs a message with no level specified.
 *  Defaults to 0 level.
 */
- (void)logMessage:(NSString*)message category:(NSString*)category;

/*
 *  Logs a message with no category specified.
 *  It is recommended you always use a cateogory
 *  if able!
 *  Category will default to nil.
 */
- (void)logMessage:(NSString*)message level:(NSUInteger)level;

/*
 *  Logs a message with a category and level.
 */
- (void)logMessage:(NSString*)message category:(NSString*)category level:(NSUInteger)level;

@end
