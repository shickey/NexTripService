//
//  NTService.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <Foundation/Foundation.h>
#import "NTConstants.h"

@interface NTService : NSObject

- (void)requestRoutesWithCompletion:(void(^)(NSArray *routes, NSError *error))completion;

- (void)requestDirectionsForRoute:(NSInteger)routeNumber
                   withCompletion:(void(^)(NSArray *directions, NSError *error))completion;

- (void)requestStopsForRoute:(NSInteger)routeNumber
                   direction:(NTDirectionValue)direction
              withCompletion:(void(^)(NSArray *stops, NSError *error))completion;

- (void)requestDeparturesForRoute:(NSInteger)routeNumber
                        direction:(NTDirectionValue)direction
                             stop:(NSString *)stopIdentifier
                   withCompletion:(void(^)(NSArray *departures, NSError *error))completion;

- (void)requestDeparturesForStopNumber:(NSInteger)stopNumber
                        withCompletion:(void(^)(NSArray *departures, NSError *error))completion;

@end
