//
//  NTSRoute.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTSRoute.h"

@implementation NTSRoute

+ (NSDictionary *)jsonMapping
{
    return @{@"Description": @"routeDescription",
             @"ProviderID" : @"providerId",
             @"Route"      : @"routeNumber"};
}

@end
