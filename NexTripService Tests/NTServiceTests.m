//
//  NTServiceTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "NTService.h"
#import "TRVSMonitor.h"

@interface NTServiceTests : XCTestCase

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
    
    [monitor wait];
    
    XCTAssertNotNil(returnedRoutes);
}

@end
