//
//  RBKDebugLogger.m
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-10.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import "RBKDebugLogger.h"
#import <MagicalRecord/MagicalRecord+Setup.h>
#import <MagicalRecord/MagicalRecord.h>
#import <CoreData+MagicalRecord.h>

@implementation RBKDebugLogger

#pragma mark - Initialisation / Teardown

RBKDebugLogger *sharedDebugLogger = nil;

+ (RBKDebugLogger*)sharedDebugLogger {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedDebugLogger = [[RBKDebugLogger alloc] init];
    });
    return sharedDebugLogger;
}

- (id)init {
    if((self = [super init])) {
        [self setupMagicalRecord];
        [self createSession];
    }
    return self;
}

- (void)dealloc {
    [self logSessionEnd];
}

- (void)setupMagicalRecord {
    NSString *store = [MagicalRecord defaultStoreName];
    NSLog(@"Default store: %@", store);
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:store];
    if (![NSPersistentStore MR_defaultPersistentStore]) { // For now just delete databse on conflicts
        [MagicalRecord cleanUp];
        [[NSFileManager defaultManager] removeItemAtURL:[NSPersistentStore MR_urlForStoreName:store] error:nil];
        [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:store];
    }
}

- (void)createSession {
    self.currentSession = [RBKDebugSession MR_createEntity];
    self.currentSession.startDate = [NSDate date];
    [self.currentSession.managedObjectContext save:nil];
}

- (void)logSessionEnd {
    self.currentSession.endDate = [NSDate date];
    [self.currentSession.managedObjectContext save:nil];
}

#pragma mark - Logging

- (void)logWithCategory:(NSString *)category level:(NSUInteger)level message:(NSString *)message, ... {
    va_list args;
    va_start(args, message);
    NSString *formattedMessage = [[NSString alloc] initWithFormat:message arguments:args];
    va_end(args);
    
    NSLog(@"Message: %@", formattedMessage);
}

- (void)logMessage:(NSString *)message category:(NSString *)category level:(NSUInteger)level {
    RBKLogMessage *log = [RBKLogMessage MR_createEntity];
    log.message = message;
    log.category = category;
    log.levelValue = level;
    log.timestamp = [NSDate date];
    [log.managedObjectContext save:nil];
    
    if(level >= self.logPrintLevel) {
        NSLog(@"%@ (%lu): %@", category, (unsigned long)level, message);
    }
}

@end
