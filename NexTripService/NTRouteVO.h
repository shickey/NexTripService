//
//  NTRouteVO.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <Foundation/Foundation.h>
#import "NTValueObject.h"

@interface NTRouteVO : NTValueObject

@property (copy, nonatomic) NSString *routeDescription;
@property (copy, nonatomic) NSString *providerId;
@property (copy, nonatomic) NSString *routeNumber;

@end
