//
//  NSDate+NexTripService.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (NexTripService)

+ (NSDate *)dateWithJSONDate:(NSString *)jsonDate;

@end
