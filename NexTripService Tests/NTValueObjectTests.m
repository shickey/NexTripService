//
//  NTValueObjectTests.m
//  NexTripService Tests
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <XCTest/XCTest.h>
#import "NexTripService.h"

@interface NTValueObjectTests : XCTestCase

- (NSDictionary *)validRouteDictionary;
- (NSDictionary *)validStopDictionary;

@end

@implementation NTValueObjectTests

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

- (void)testCreatesRouteVOWithValidRouteDictionary
{
    NSDictionary *routeDict = [self validRouteDictionary];
    NTRouteVO *vo = [NTRouteVO valueObjectFromJSON:routeDict];
    XCTAssertEqual(routeDict[@"Description"], vo.routeDescription, @"Route description was not set properly. Expected %@, Got %@", routeDict[@"Description"], vo.routeDescription);
    XCTAssertEqual(routeDict[@"ProviderID"], vo.providerId, @"Provider Id was not set properly. Expected %@, Got %@", routeDict[@"ProviderID"], vo.providerId);
    XCTAssertEqual(routeDict[@"Route"], vo.routeNumber, @"Route number was not set properly. Expected %@, Got %@", routeDict[@"Route"], vo.routeNumber);
}

- (void)testCreatesStopVOWithValidStopDictionary
{
    NSDictionary *stopDict = [self validStopDictionary];
    NTStopVO *vo = [NTStopVO valueObjectFromJSON:stopDict];
    XCTAssertEqual(stopDict[@"Text"], vo.name, @"Stop name was not set properly. Expected %@, Got %@", stopDict[@"Text"], vo.name);
    XCTAssertEqual(stopDict[@"Value"], vo.identifier, @"Stop name was not set properly. Expected %@, Got %@", stopDict[@"Value"], vo.identifier);
}

#pragma mark - Helper Methods

- (NSDictionary *)validRouteDictionary
{
    return @{@"Description": @"Awesome route!",
             @"ProviderID" : @"1",
             @"Route"      : @"777"};
}

- (NSDictionary *)validStopDictionary
{
    return @{@"Text" : @"53rd and 3rd",
             @"Value": @"5R3R"};
}

@end
