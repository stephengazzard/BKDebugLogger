// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RBKLogMessage.m instead.

#import "_RBKLogMessage.h"

const struct RBKLogMessageAttributes RBKLogMessageAttributes = {
	.category = @"category",
	.level = @"level",
	.message = @"message",
	.timestamp = @"timestamp",
};

const struct RBKLogMessageRelationships RBKLogMessageRelationships = {
	.session = @"session",
};

const struct RBKLogMessageFetchedProperties RBKLogMessageFetchedProperties = {
};

@implementation RBKLogMessageID
@end

@implementation _RBKLogMessage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RBKLogMessage" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RBKLogMessage";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RBKLogMessage" inManagedObjectContext:moc_];
}

- (RBKLogMessageID*)objectID {
	return (RBKLogMessageID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"levelValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"level"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic category;






@dynamic level;



- (short)levelValue {
	NSNumber *result = [self level];
	return [result shortValue];
}

- (void)setLevelValue:(short)value_ {
	[self setLevel:[NSNumber numberWithShort:value_]];
}

- (short)primitiveLevelValue {
	NSNumber *result = [self primitiveLevel];
	return [result shortValue];
}

- (void)setPrimitiveLevelValue:(short)value_ {
	[self setPrimitiveLevel:[NSNumber numberWithShort:value_]];
}





@dynamic message;






@dynamic timestamp;






@dynamic session;

	





@end
