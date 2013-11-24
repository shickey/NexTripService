//
//  NTStopVO.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <Foundation/Foundation.h>
#import "NTValueObject.h"

@interface NTStopVO : NTValueObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *identifier;

@end
