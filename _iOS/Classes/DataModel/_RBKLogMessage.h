// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RBKLogMessage.h instead.

#import <CoreData/CoreData.h>


extern const struct RBKLogMessageAttributes {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *level;
	__unsafe_unretained NSString *message;
	__unsafe_unretained NSString *timestamp;
} RBKLogMessageAttributes;

extern const struct RBKLogMessageRelationships {
	__unsafe_unretained NSString *session;
} RBKLogMessageRelationships;

extern const struct RBKLogMessageFetchedProperties {
} RBKLogMessageFetchedProperties;

@class RBKDebugSession;






@interface RBKLogMessageID : NSManagedObjectID {}
@end

@interface _RBKLogMessage : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RBKLogMessageID*)objectID;




@property (nonatomic, strong) NSString *category;


//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *level;


@property short levelValue;
- (short)levelValue;
- (void)setLevelValue:(short)value_;

//- (BOOL)validateLevel:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *message;


//- (BOOL)validateMessage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate *timestamp;


//- (BOOL)validateTimestamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) RBKDebugSession* session;

//- (BOOL)validateSession:(id*)value_ error:(NSError**)error_;




@end

@interface _RBKLogMessage (CoreDataGeneratedAccessors)

@end

@interface _RBKLogMessage (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;




- (NSNumber*)primitiveLevel;
- (void)setPrimitiveLevel:(NSNumber*)value;

- (short)primitiveLevelValue;
- (void)setPrimitiveLevelValue:(short)value_;




- (NSString*)primitiveMessage;
- (void)setPrimitiveMessage:(NSString*)value;




- (NSDate*)primitiveTimestamp;
- (void)setPrimitiveTimestamp:(NSDate*)value;





- (RBKDebugSession*)primitiveSession;
- (void)setPrimitiveSession:(RBKDebugSession*)value;


@end
