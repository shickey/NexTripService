//
//  NTSValueObject.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTSValueObject.h"
#import "NSDate+NexTripService.h"

@implementation NTSValueObject

+ (id)valueObjectFromJSON:(NSDictionary *)json
{
    NTSValueObject *vo = [[self alloc] init];
    NSDictionary *mapping = [self jsonMapping];
    NSDictionary *valueTypes = [self jsonValueTypes];
    
    for (NSString *jsonKey in mapping) {
        if (json[jsonKey]) {
            NSString *voKey = mapping[jsonKey];
            id value = json[jsonKey];
            if (valueTypes[jsonKey]) {
                if ([valueTypes[jsonKey] integerValue] == NTSJSONValueTypeDate) {
                    value = [NSDate dateWithJSONDate:value];
                }
            }
            [vo setValue:value forKey:voKey];
        }
    }
    return vo;
}

+ (NSDictionary *)jsonMapping
{
    return nil;
}

+ (NSDictionary *)jsonValueTypes
{
    return nil;
}

@end
