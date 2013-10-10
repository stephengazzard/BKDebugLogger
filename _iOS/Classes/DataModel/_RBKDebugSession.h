// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RBKDebugSession.h instead.

#import <CoreData/CoreData.h>


extern const struct RBKDebugSessionAttributes {
	__unsafe_unretained NSString *endDate;
	__unsafe_unretained NSString *startDate;
} RBKDebugSessionAttributes;

extern const struct RBKDebugSessionRelationships {
	__unsafe_unretained NSString *logs;
} RBKDebugSessionRelationships;

extern const struct RBKDebugSessionFetchedProperties {
} RBKDebugSessionFetchedProperties;

@class RBKLogMessage;




@interface RBKDebugSessionID : NSManagedObjectID {}
@end

@interface _RBKDebugSession : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RBKDebugSessionID*)objectID;




@property (nonatomic, strong) NSDate *endDate;


//- (BOOL)validateEndDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate *startDate;


//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet* logs;

- (NSMutableSet*)logsSet;




@end

@interface _RBKDebugSession (CoreDataGeneratedAccessors)

- (void)addLogs:(NSSet*)value_;
- (void)removeLogs:(NSSet*)value_;
- (void)addLogsObject:(RBKLogMessage*)value_;
- (void)removeLogsObject:(RBKLogMessage*)value_;

@end

@interface _RBKDebugSession (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveEndDate;
- (void)setPrimitiveEndDate:(NSDate*)value;




- (NSDate*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSDate*)value;





- (NSMutableSet*)primitiveLogs;
- (void)setPrimitiveLogs:(NSMutableSet*)value;


@end
