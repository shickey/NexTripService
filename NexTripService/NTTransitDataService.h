//
//  NTTransitDataService.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <Foundation/Foundation.h>

@interface NTTransitDataService : NSObject

- (void)queryStopsInRectangleXMin:(double)xMin
                             xMax:(double)xMax
                             yMin:(double)yMin
                             yMax:(double)yMax
                   withCompletion:(void(^)(NSArray *stops, NSError *error))completion;

@end
