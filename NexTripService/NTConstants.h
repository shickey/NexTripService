//
//  NTConstants.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <Foundation/Foundation.h>

typedef enum NTDirectionValue : NSUInteger {
    NTDirectionSouthbound   = 1,
    NTDirectionEastbound    = 2,
    NTDirectionWestbound    = 3,
    NTDirectionNorthbound   = 4
} NTDirectionValue;

extern NSString *const kNTBaseURLString;