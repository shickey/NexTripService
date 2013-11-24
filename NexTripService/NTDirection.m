//
//  NTDirection.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTDirection.h"

@implementation NTDirection

+ (NSDictionary *)jsonMapping
{
    return @{@"Value": @"direction"};
}

- (NSString *)metroTransitString
{
    switch (self.direction) {
        case NTDirectionSouthbound:
            return @"SOUTHBOUND";
            break;
        case NTDirectionEastbound:
            return @"EASTBOUND";
            break;
        case NTDirectionWestbound:
            return @"WESTBOUND";
            break;
        case NTDirectionNorthbound:
            return @"NORTHBOUND";
            break;
        default:
            break;
    }
    return nil;
}

- (NSString *)capitalizedString
{
    return [[self metroTransitString] capitalizedString];
}

- (NSString *)lowercaseString
{
    return [[self metroTransitString] lowercaseString];
}

- (NSString *)abbreviation
{
    return [[self metroTransitString] substringToIndex:1];
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    NTDirection *directionObject = (NTDirection *)object;
    if (self.direction == directionObject.direction) {
        return YES;
    }
    return NO;
}

@end
