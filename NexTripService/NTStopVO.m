//
//  NTStopVO.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTStopVO.h"

@implementation NTStopVO

+ (NSDictionary *)jsonMapping
{
    return @{@"Text" : @"name",
             @"Value": @"identifier"};
}

@end
