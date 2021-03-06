//
//  NTSService.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTSService.h"
#import "NTSConstants.h"
#import "NTSRoute.h"
#import "NTSDirection.h"
#import "NTSStop.h"
#import "NTSDeparture.h"
#import "AFNetworking.h"

@interface NTSService ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

- (NSURL *)baseURL;

@end


@implementation NTSService

#pragma mark - Initializers

- (id)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self baseURL]];
        AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _manager.requestSerializer = serializer;
    }
    return self;
}

#pragma mark - Public Methods

- (void)requestRoutesWithCompletion:(void(^)(NSArray *routes, NSError *error))completion
{
    [self.manager GET:@"Routes" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSArray *json = (NSArray *)responseObject;
            NSMutableArray *routeVOs = [[NSMutableArray alloc] init];
            for (NSDictionary *jsonRoute in json) {
                NTSRoute *routeVO = [NTSRoute valueObjectFromJSON:jsonRoute];
                [routeVOs addObject:routeVO];
            }
            NSArray *immutableRoutes = [NSArray arrayWithArray:routeVOs];
            completion(immutableRoutes, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

- (void)requestDirectionsForRoute:(NSInteger)routeNumber
                   withCompletion:(void(^)(NSArray *directions, NSError *error))completion
{
    NSString *endpoint = [NSString stringWithFormat:@"Directions/%ld", (long)routeNumber];
    [self.manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSArray *json = (NSArray *)responseObject;
            NSMutableArray *directionVOs = [[NSMutableArray alloc] init];
            for (NSDictionary *jsonDirection in json) {
                NTSDirection *directionVO = [NTSDirection valueObjectFromJSON:jsonDirection];
                [directionVOs addObject:directionVO];
            }
            NSArray *immutableDirections = [NSArray arrayWithArray:directionVOs];
            completion(immutableDirections, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

- (void)requestStopsForRoute:(NSInteger)routeNumber
                   direction:(NTSDirectionValue)direction
              withCompletion:(void (^)(NSArray *, NSError *))completion
{
    NSString *endpoint = [NSString stringWithFormat:@"Stops/%ld/%ld", (long)routeNumber, (long)direction];
    [self.manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSArray *json = (NSArray *)responseObject;
            NSMutableArray *stopVOs = [[NSMutableArray alloc] init];
            for (NSDictionary *jsonStop in json) {
                NTSStop *stopVO = [NTSStop valueObjectFromJSON:jsonStop];
                [stopVOs addObject:stopVO];
            }
            NSArray *immutableStops = [NSArray arrayWithArray:stopVOs];
            completion(immutableStops, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

- (void)requestDeparturesForRoute:(NSInteger)routeNumber
                        direction:(NTSDirectionValue)direction
                             stop:(NSString *)stopIdentifier
                   withCompletion:(void (^)(NSArray *, NSError *))completion
{
    NSString *endpoint = [NSString stringWithFormat:@"%ld/%ld/%@", (long)routeNumber, (long)direction, stopIdentifier];
    [self.manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSArray *json = (NSArray *)responseObject;
            NSMutableArray *departureVOs = [[NSMutableArray alloc] init];
            for (NSDictionary *jsonDeparture in json) {
                NTSDeparture *departure = [NTSDeparture valueObjectFromJSON:jsonDeparture];
                [departureVOs addObject:departure];
            }
            NSArray *immutableDepartures = [NSArray arrayWithArray:departureVOs];
            completion(immutableDepartures, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
    
}

- (void)requestDeparturesForStopNumber:(NSInteger)stopNumber
                        withCompletion:(void (^)(NSArray *, NSError *))completion
{
    NSString *endpoint = [NSString stringWithFormat:@"%ld", (long)stopNumber];
    [self.manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            NSArray *json = (NSArray *)responseObject;
            NSMutableArray *departureVOs = [[NSMutableArray alloc] init];
            for (NSDictionary *jsonDeparture in json) {
                NTSDeparture *departure = [NTSDeparture valueObjectFromJSON:jsonDeparture];
                [departureVOs addObject:departure];
            }
            NSArray *immutableDepartures = [NSArray arrayWithArray:departureVOs];
            completion(immutableDepartures, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            completion(nil, error);
        }
    }];
}

#pragma mark - Class Extension Methods

- (NSURL *)baseURL
{
    return [NSURL URLWithString:kNTSBaseURLString];
}

@end
