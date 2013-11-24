//
//  NTDirection.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTValueObject.h"
#import "NTConstants.h"

@interface NTDirection : NTValueObject

@property (assign, nonatomic) NTDirectionValue direction;

- (NSString *)metroTransitString;
- (NSString *)capitalizedString;
- (NSString *)lowercaseString;
- (NSString *)abbreviation;

@end
