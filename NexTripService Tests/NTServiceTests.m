//
//  NTServiceTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "NTService.h"
#import "NTRoute.h"
#import "TRVSMonitor.h"

@interface NTServiceTests : XCTestCase

- (NTRoute *)validRoute;

@end

@implementation NTServiceTests

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
    NTService *service = [[NTService alloc] init];
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
    NTService *service = [[NTService alloc] init];
    [service requestDirectionsForRoute:[self validRoute] withCompletion:^(NSArray *directions, NSError *error) {
        returnedDirections = directions;
        [monitor signal];
    }];
    
    [monitor waitWithTimeout:5];
    
    XCTAssertNotNil(returnedDirections);
}

#pragma mark - Helper Methods

- (NTRoute *)validRoute
{
    return [NTRoute valueObjectFromJSON:@{@"ProviderID"  : @"8",
                                          @"Route"       : @"3",
                                          @"Description" : @"3 - U of M - Como Av - Energy Park Dr - Maryland Av"}];
}

@end
