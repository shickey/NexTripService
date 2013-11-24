//
//  NTValueObject.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <Foundation/Foundation.h>

@interface NTValueObject : NSObject

+ (id)valueObjectFromJSON:(NSDictionary *)json;
+ (NSDictionary *)jsonMapping;

@end
