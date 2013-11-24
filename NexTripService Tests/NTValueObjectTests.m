//
//  NTValueObjectTests.m
//  NexTripService Tests
//
//  Created by Sean Hickey on 11/23/13.
//
//

#import <XCTest/XCTest.h>
#import "NexTripService.h"
#import "NSDate+NexTripService.h"

@interface NTValueObjectTests : XCTestCase

- (NSDictionary *)validRouteDictionary;
- (NSDictionary *)validStopDictionary;
- (NSDictionary *)validDepartureDictionary;

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
    NTRoute *vo = [NTRoute valueObjectFromJSON:routeDict];
    XCTAssertEqual(routeDict[@"Description"], vo.routeDescription, @"Route description was not set properly. Expected %@, Got %@", routeDict[@"Description"], vo.routeDescription);
    XCTAssertEqual(routeDict[@"ProviderID"], vo.providerId, @"Provider Id was not set properly. Expected %@, Got %@", routeDict[@"ProviderID"], vo.providerId);
    XCTAssertEqual(routeDict[@"Route"], vo.routeNumber, @"Route number was not set properly. Expected %@, Got %@", routeDict[@"Route"], vo.routeNumber);
}

- (void)testCreatesStopVOWithValidStopDictionary
{
    NSDictionary *stopDict = [self validStopDictionary];
    NTStop *vo = [NTStop valueObjectFromJSON:stopDict];
    XCTAssertEqual(stopDict[@"Text"], vo.name, @"Stop name was not set properly. Expected %@, Got %@", stopDict[@"Text"], vo.name);
    XCTAssertEqual(stopDict[@"Value"], vo.identifier, @"Stop identifier was not set properly. Expected %@, Got %@", stopDict[@"Value"], vo.identifier);
}

- (void)testCreatesDepartureVOWithValidDepartureDictionary
{
    NSDictionary *timeDict = [self validDepartureDictionary];
    NTDeparture *vo = [NTDeparture valueObjectFromJSON:timeDict];
    XCTAssertEqual(timeDict[@"Actual"], vo.actual, @"Time actual boolean was not set properly. Expected %@, Got %@", timeDict[@"Actual"], vo.actual);
    XCTAssertEqual(timeDict[@"VehicleLongitude"], vo.longitude, @"Time logitiude was not set properly. Expected %@, Got %@", timeDict[@"VehicleLongitude"], vo.longitude);
    XCTAssertEqual(timeDict[@"VehicleLatitude"], vo.latitude, @"Time logitiude was not set properly. Expected %@, Got %@", timeDict[@"VehicleLatitude"], vo.latitude);
    XCTAssertEqual(timeDict[@"Terminal"], vo.terminal, @"Time terminal was not set properly. Expected %@, Got %@", timeDict[@"Terminal"], vo.terminal);
    XCTAssertEqual(timeDict[@"RouteDirection"], vo.direction, @"Time direction was not set properly. Expected %@, Got %@", timeDict[@"RouteDirection"], vo.direction);
    XCTAssertEqual(timeDict[@"Description"], vo.scrollText, @"Time scroll text was not set properly. Expected %@, Got %@", timeDict[@"Description"], vo.scrollText);
    XCTAssertEqual(timeDict[@"DepartureText"], vo.departureText, @"Time departure text was not set properly. Expected %@, Got %@", timeDict[@"DepartureText"], vo.departureText);
    XCTAssertEqual([NSDate dateWithJSONDate:timeDict[@"DepartureTime"]], vo.departureTime, @"Time departure time was not set properly. Expected %@, Got %@", [NSDate dateWithJSONDate:timeDict[@"DepartureTime"]], vo.departureTime);
    XCTAssertEqual(timeDict[@"Gate"], vo.gate, @"Time gate was not set properly. Expected %@, Got %@", timeDict[@"Gate"], vo.gate);
    XCTAssertEqual(timeDict[@"BlockNumber"], vo.block, @"Time block was not set properly. Expected %@, Got %@", timeDict[@"BlockNumber"], vo.block);
    XCTAssertEqual(timeDict[@"VehicleHeading"], vo.heading, @"Time heading was not set properly. Expected %@, Got %@", timeDict[@"VehicleHeading"], vo.heading);
    XCTAssertEqual(timeDict[@"Route"], vo.route, @"Time route was not set properly. Expected %@, Got %@", timeDict[@"Route"], vo.route);
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

- (NSDictionary *)validDepartureDictionary
{
    return @{@"Actual"           : @NO,
             @"VehicleLongitude" : @0,
             @"VehicleLatitude"  : @0,
             @"Terminal"         : @"A",
             @"RouteDirection"   : @"EASTBOUND",
             @"Description"      : @"Selby-Lake / St Paul",
             @"DepartureText"    : @"11:44",
             @"DepartureTime"    : @"/Date(1385271840000-0600)/",
             @"Gate"             : @"",
             @"BlockNumber"      : @1240,
             @"VehicleHeading"   : @0,
             @"Route"            : @"21"};
}

@end
