//
//  NTSConstants.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <Foundation/Foundation.h>

typedef enum NTSDirectionValue : NSUInteger {
    NTSDirectionSouthbound   = 1,
    NTSDirectionEastbound    = 2,
    NTSDirectionWestbound    = 3,
    NTSDirectionNorthbound   = 4
} NTSDirectionValue;

extern NSString *const kNTSBaseURLString;