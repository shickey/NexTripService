//
//  NSDate+NexTripService.m
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NSDate+NexTripService.h"

@implementation NSDate (NexTripService)

+ (NSDate *)dateWithJSONDate:(NSString *)jsonDate
{
    if (![jsonDate hasPrefix:@"/Date("] || ![jsonDate hasSuffix:@")/"]) {
        return nil;
    }
    
    NSString *strippedDate = [[jsonDate stringByReplacingOccurrencesOfString:@"/Date(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
    
    NSCharacterSet *plusMinusSet = [NSCharacterSet characterSetWithCharactersInString:@"+-"];
    NSString *ticks = nil;
    NSString *offset = nil;
    NSRange offsetChar = [strippedDate rangeOfCharacterFromSet:plusMinusSet];
    if (offsetChar.location != NSNotFound) {
        ticks = [strippedDate substringToIndex:offsetChar.location];
        offset = [strippedDate substringFromIndex:offsetChar.location];
    }
    else {
        ticks = strippedDate;
    }

    NSCharacterSet *notNumerals = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    if ([ticks rangeOfCharacterFromSet:notNumerals].location != NSNotFound) {
        // This string contains non-numerals. Abort attempting to parse it
        return nil;
    }
    
    NSTimeInterval timeSinceEpoch = [ticks doubleValue] / 1000.0;
    
    if (nil != offset) {
        // Ignore Offset for the time being. It doesn't seem to affect the date object.
//        NSTimeInterval offsetToAdd = [offset doubleValue] * 60.0;
//        timeSinceEpoch += (offsetToAdd * -1.0);
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeSinceEpoch];
    
    return date;
}

@end
