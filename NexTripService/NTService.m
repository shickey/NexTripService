//
//  NTService.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import "NTService.h"
#import "NTConstants.h"
#import "NTRoute.h"
#import "AFNetworking/AFNetworking.h"

@interface NTService ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

- (NSURL *)baseURL;

@end


@implementation NTService

#pragma mark - Initializers

- (id)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[self baseURL]];
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
                NTRoute *routeVO = [NTRoute valueObjectFromJSON:jsonRoute];
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

#pragma mark - Class Extension Methods

- (NSURL *)baseURL
{
    return [NSURL URLWithString:kNTBaseURLString];
}

@end