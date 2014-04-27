//
//  NTSDirection.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTSDirection.h"

@implementation NTSDirection

+ (NSDictionary *)jsonMapping
{
    return @{@"Value": @"direction"};
}

- (NSString *)metroTransitString
{
    switch (self.direction) {
        case NTSDirectionSouthbound:
            return @"SOUTHBOUND";
            break;
        case NTSDirectionEastbound:
            return @"EASTBOUND";
            break;
        case NTSDirectionWestbound:
            return @"WESTBOUND";
            break;
        case NTSDirectionNorthbound:
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
    NTSDirection *directionObject = (NTSDirection *)object;
    if (self.direction == directionObject.direction) {
        return YES;
    }
    return NO;
}

@end
