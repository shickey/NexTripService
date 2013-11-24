//
//  NTStopVO.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTStop.h"

@implementation NTStop

+ (NSDictionary *)jsonMapping
{
    return @{@"Text" : @"name",
             @"Value": @"identifier"};
}

@end
