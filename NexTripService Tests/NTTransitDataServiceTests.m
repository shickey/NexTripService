//
//  NTTransitDataServiceTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "TRVSMonitor.h"
#import "NTTransitDataService.h"

@interface NTTransitDataServiceTests : XCTestCase

@end

@implementation NTTransitDataServiceTests

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

- (void)testTransitDataService
{
    TRVSMonitor *monitor = [TRVSMonitor monitor];
    NTTransitDataService *service = [[NTTransitDataService alloc] init];
    [service queryStopsInRectangleXMin:-94.0 xMax:-92.0 yMin:44.0 yMax:46.0 withCompletion:^(NSArray *stops, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            XCTFail();
        }
        [monitor signal];
    }];
    [monitor wait];
}

@end
