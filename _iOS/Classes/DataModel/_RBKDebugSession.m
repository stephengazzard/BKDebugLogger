// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RBKDebugSession.m instead.

#import "_RBKDebugSession.h"

const struct RBKDebugSessionAttributes RBKDebugSessionAttributes = {
	.endDate = @"endDate",
	.startDate = @"startDate",
};

const struct RBKDebugSessionRelationships RBKDebugSessionRelationships = {
	.logs = @"logs",
};

const struct RBKDebugSessionFetchedProperties RBKDebugSessionFetchedProperties = {
};

@implementation RBKDebugSessionID
@end

@implementation _RBKDebugSession

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"RBKDebugSession" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"RBKDebugSession";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"RBKDebugSession" inManagedObjectContext:moc_];
}

- (RBKDebugSessionID*)objectID {
	return (RBKDebugSessionID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic endDate;






@dynamic startDate;






@dynamic logs;

	
- (NSMutableSet*)logsSet {
	[self willAccessValueForKey:@"logs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"logs"];
  
	[self didAccessValueForKey:@"logs"];
	return result;
}
	





@end
