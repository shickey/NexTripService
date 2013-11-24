//
//  NTRouteVO.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTRoute.h"

@implementation NTRoute

+ (NSDictionary *)jsonMapping
{
    return @{@"Description": @"routeDescription",
             @"ProviderID" : @"providerId",
             @"Route"      : @"routeNumber"};
}

@end
