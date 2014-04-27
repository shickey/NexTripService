//
//  NTSValueObject.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <Foundation/Foundation.h>

typedef enum NTSJSONValueType : NSUInteger {
    NTSJSONValueTypeString   = 0,
    NTSJSONValueTypeDate     = 1
} NTSJSONValueType;

@interface NTSValueObject : NSObject

+ (id)valueObjectFromJSON:(NSDictionary *)json;
+ (NSDictionary *)jsonMapping;
+ (NSDictionary *)jsonValueTypes;

@end
