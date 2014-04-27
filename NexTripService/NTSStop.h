//
//  NTSStop.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTSValueObject.h"

@interface NTSStop : NTSValueObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *identifier;

@end
