//
//  NTSStop.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTSStop.h"

@implementation NTSStop

+ (NSDictionary *)jsonMapping
{
    return @{@"Text" : @"name",
             @"Value": @"identifier"};
}

@end
