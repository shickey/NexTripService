//
//  NTService.h
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <Foundation/Foundation.h>

@interface NTService : NSObject

- (void)requestRoutesWithCompletion:(void(^)(NSArray *routes, NSError *error))completion;

@end
