//
//  NTValueObject.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <Foundation/Foundation.h>

typedef enum NTJSONValueType : NSUInteger {
    NTJSONValueTypeString   = 0,
    NTJSONValueTypeDate     = 1
} NTJSONValueType;

@interface NTValueObject : NSObject

+ (id)valueObjectFromJSON:(NSDictionary *)json;
+ (NSDictionary *)jsonMapping;
+ (NSDictionary *)jsonValueTypes;

@end
