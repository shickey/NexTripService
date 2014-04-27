//
//  NTSDirection.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTSValueObject.h"
#import "NTSConstants.h"

@interface NTSDirection : NTSValueObject

@property (assign, nonatomic) NTSDirectionValue direction;

- (NSString *)metroTransitString;
- (NSString *)capitalizedString;
- (NSString *)lowercaseString;
- (NSString *)abbreviation;

@end
