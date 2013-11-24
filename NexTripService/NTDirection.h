//
//  NTDirection.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTValueObject.h"

typedef enum NTDirectionValue : NSUInteger {
    NTDirectionSouthbound   = 1,
    NTDirectionEastbound    = 2,
    NTDirectionWestbound    = 3,
    NTDirectionNorthbound   = 4
} NTDirectionValue;

@interface NTDirection : NTValueObject

@property (assign, nonatomic) NTDirectionValue direction;

- (NSString *)metroTransitString;
- (NSString *)capitalizedString;
- (NSString *)lowercaseString;
- (NSString *)abbreviation;

@end
