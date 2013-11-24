//
//  NTStopVO.h
//  NexTripService
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import "NTValueObject.h"

@interface NTStop : NTValueObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *identifier;

@end
