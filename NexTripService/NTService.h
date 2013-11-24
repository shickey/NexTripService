//
//  NTService.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <Foundation/Foundation.h>

@class NTRoute, NTDirection;

@interface NTService : NSObject

- (void)requestRoutesWithCompletion:(void(^)(NSArray *routes, NSError *error))completion;
- (void)requestDirectionsForRoute:(NTRoute *)route withCompletion:(void(^)(NSArray *directions, NSError *error))completion;
- (void)requestStopsForRoute:(NTRoute *)route direction:(NTDirection *)direction withCompletion:(void(^)(NSArray *stops, NSError *error))completion;

@end
