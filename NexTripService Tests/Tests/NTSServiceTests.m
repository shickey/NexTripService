//
//  NTSServiceTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "NTSService.h"
#import "NTSRoute.h"
#import "NTSDirection.h"
#import "NTSStop.h"
#import "TRVSMonitor.h"

@interface NTSServiceTests : XCTestCase

- (NTSRoute *)validRoute;
- (NTSDirection *)validDirection;
- (NTSStop *)validStop;
- (NSInteger)validStopNumber;

@end

@implementation NTSServiceTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testRouteFetching
{
    __block TRVSMonitor *monitor = [TRVSMonitor monitor];
    __block NSArray *returnedRoutes = nil;
    NTSService *service = [[NTSService alloc] init];
    [service requestRoutesWithCompletion:^(NSArray *routes, NSError *error) {
        returnedRoutes = routes;
        [monitor signal];
    }];
    
    [monitor waitWithTimeout:5];
    
    XCTAssertNotNil(returnedRoutes);
}

- (void)testDirectionFetching
{
    __block TRVSMonitor *monitor = [TRVSMonitor monitor];
    __block NSArray *returnedDirections = nil;
    NTSService *service = [[NTSService alloc] init];
    [service requestDirectionsForRoute:[self validRoute].routeNumber withCompletion:^(NSArray *directions, NSError *error) {
        returnedDirections = directions;
        [monitor signal];
    }];
    
    [monitor waitWithTimeout:5];
    
    XCTAssertNotNil(returnedDirections);
}

- (void)testStopFetching
{
    __block TRVSMonitor *monitor = [TRVSMonitor monitor];
    __block NSArray *returnedStops = nil;
    NTSService *service = [[NTSService alloc] init];
    [service requestStopsForRoute:[self validRoute].routeNumber direction:[self validDirection].direction withCompletion:^(NSArray *stops, NSError *error) {
        returnedStops = stops;
        [monitor signal];
    }];
    
    [monitor waitWithTimeout:5];
    
    XCTAssertNotNil(returnedStops);
}

- (void)testDepatureFetchingFromRouteDirectionStop
{
    __block TRVSMonitor *monitor = [TRVSMonitor monitor];
    __block NSArray *returnedDepartures = nil;
    NTSService *service = [[NTSService alloc] init];
    [service requestDeparturesForRoute:[self validRoute].routeNumber
                             direction:[self validDirection].direction
                                  stop:[self validStop].identifier
                        withCompletion:^(NSArray *departures, NSError *error) {
                            returnedDepartures = departures;
                            [monitor signal];
                        }];
    
    [monitor waitWithTimeout:5];
    XCTAssertNotNil(returnedDepartures);
}

- (void)testDepartureFetchingFromStopNumber
{
    __block TRVSMonitor *monitor = [TRVSMonitor monitor];
    __block NSArray *returnedDepartures = nil;
    NTSService *service = [[NTSService alloc] init];
    [service requestDeparturesForStopNumber:[self validStopNumber]
                        withCompletion:^(NSArray *departures, NSError *error) {
                            returnedDepartures = departures;
                            [monitor signal];
                        }];
    
    [monitor waitWithTimeout:5];
    XCTAssertNotNil(returnedDepartures);

}

#pragma mark - Helper Methods

- (NTSRoute *)validRoute
{
    return [NTSRoute valueObjectFromJSON:@{@"ProviderID"  : @"8",
                                          @"Route"       : @"21",
                                          @"Description" : @"21 - Uptown - Lake St - Selby  Av"}];
}

- (NTSDirection *)validDirection
{
    return [NTSDirection valueObjectFromJSON:@{@"Text"  : @"EASTBOUND",
                                              @"Value" : @"2"}];
}

- (NTSStop *)validStop
{
    return [NTSStop valueObjectFromJSON:@{@"Text"  : @"Lake St/Midtown Station (Hiawatha Ave)",
                                         @"Value" : @"LAHI"}];
}

- (NSInteger)validStopNumber
{
    return 16868;
}

@end
