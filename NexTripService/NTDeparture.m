//
//  NTTimeVO.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTDeparture.h"

@implementation NTDeparture

+ (NSDictionary *)jsonMapping
{
    return @{@"Actual"           : @"actual",
             @"VehicleLongitude" : @"longitude",
             @"VehicleLatitude"  : @"latitude",
             @"Terminal"         : @"terminal",
             @"RouteDirection"   : @"direction",
             @"Description"      : @"scrollText",
             @"DepartureText"    : @"departureText",
             @"DepartureTime"    : @"departureTime",
             @"Gate"             : @"gate",
             @"BlockNumber"      : @"block",
             @"VehicleHeading"   : @"heading",
             @"Route"            : @"route"};
}

+ (NSDictionary *)jsonValueTypes
{
    return @{@"DepartureTime": @(NTJSONValueTypeDate)};
}

@end
