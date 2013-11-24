//
//  NTRouteVO.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTRouteVO.h"

@implementation NTRouteVO

+ (NSDictionary *)jsonMapping
{
    return @{@"Description": @"routeDescription",
             @"ProviderID" : @"providerId",
             @"Route"      : @"routeNumber"};
}

@end
