//
//  NTValueObject.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTValueObject.h"

@implementation NTValueObject

+ (id)valueObjectFromJSON:(NSDictionary *)json
{
    NTValueObject *vo = [[self alloc] init];
    NSDictionary *mapping = [self jsonMapping];
    for (NSString *jsonKey in mapping) {
        if (json[jsonKey]) {
            NSString *voKey = mapping[jsonKey];
            id value = json[jsonKey];
            [vo setValue:value forKey:voKey];
        }
    }
    return vo;
}

+ (NSDictionary *)jsonMapping
{
    return nil;
}

@end
