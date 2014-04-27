//
//  NTSDeparture.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTSValueObject.h"

@interface NTSDeparture : NTSValueObject

@property (copy, nonatomic) NSNumber *actual;
@property (copy, nonatomic) NSNumber *longitude;
@property (copy, nonatomic) NSNumber *latitude;
@property (copy, nonatomic) NSString *terminal;
@property (copy, nonatomic) NSString *direction;
@property (copy, nonatomic) NSString *scrollText;
@property (copy, nonatomic) NSString *departureText;
@property (copy, nonatomic) NSDate   *departureTime;
@property (copy, nonatomic) NSString *gate;
@property (copy, nonatomic) NSNumber *block;
@property (copy, nonatomic) NSNumber *heading;
@property (copy, nonatomic) NSString *route;

@end
