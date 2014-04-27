//
//  NTSRoute.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTSValueObject.h"

@interface NTSRoute : NTSValueObject

@property (copy, nonatomic)   NSString *routeDescription;
@property (assign, nonatomic) NSInteger providerId;
@property (assign, nonatomic) NSInteger routeNumber;

@end
