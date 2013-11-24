//
//  NTRouteVO.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTValueObject.h"

@interface NTRoute : NTValueObject

@property (copy, nonatomic) NSString *routeDescription;
@property (copy, nonatomic) NSString *providerId;
@property (copy, nonatomic) NSString *routeNumber;

@end
