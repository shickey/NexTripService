//
//  NTDirectionTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "NTDirection.h"

@interface NTDirectionTests : XCTestCase

- (NSDictionary *)validDirectionDictionary;
- (NTDirection *)southVO;
- (NTDirection *)eastVO;
- (NTDirection *)westVO;
- (NTDirection *)northVO;

@end

@implementation NTDirectionTests

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

- (void)testCreatesDirectionVOWithValidDirectionDictionary
{
    NTDirection *vo = [NTDirection valueObjectFromJSON:[self validDirectionDictionary]];
    XCTAssert(vo.direction == NTDirectionEastbound);
}

- (void)testIsEqualMethod
{
    NTDirection *vo1 = [NTDirection valueObjectFromJSON:[self validDirectionDictionary]];
    NTDirection *vo2 = [[NTDirection alloc] init];
    vo2.direction = NTDirectionEastbound;
    XCTAssert([vo1 isEqual:vo2]);
}

- (void)testMetroTransitStringRepresentation
{
    XCTAssert([[[self southVO] metroTransitString] isEqualToString:@"SOUTHBOUND"]);
    XCTAssert([[[self eastVO]  metroTransitString] isEqualToString:@"EASTBOUND"]);
    XCTAssert([[[self westVO]  metroTransitString] isEqualToString:@"WESTBOUND"]);
    XCTAssert([[[self northVO] metroTransitString] isEqualToString:@"NORTHBOUND"]);
}

- (void)testCapitalizedStringRepresentation
{
    XCTAssert([[[self southVO] capitalizedString] isEqualToString:@"Southbound"]);
    XCTAssert([[[self eastVO]  capitalizedString] isEqualToString:@"Eastbound"]);
    XCTAssert([[[self westVO]  capitalizedString] isEqualToString:@"Westbound"]);
    XCTAssert([[[self northVO] capitalizedString] isEqualToString:@"Northbound"]);
}

- (void)testLowercaseStringRepresentation
{
    XCTAssert([[[self southVO] lowercaseString] isEqualToString:@"southbound"]);
    XCTAssert([[[self eastVO]  lowercaseString] isEqualToString:@"eastbound"]);
    XCTAssert([[[self westVO]  lowercaseString] isEqualToString:@"westbound"]);
    XCTAssert([[[self northVO] lowercaseString] isEqualToString:@"northbound"]);
}

- (void)testAbbreviationRepresentation
{
    XCTAssert([[[self southVO] abbreviation] isEqualToString:@"S"]);
    XCTAssert([[[self eastVO]  abbreviation] isEqualToString:@"E"]);
    XCTAssert([[[self westVO]  abbreviation] isEqualToString:@"W"]);
    XCTAssert([[[self northVO] abbreviation] isEqualToString:@"N"]);
}

#pragma mark - Helper Methods

- (NSDictionary *)validDirectionDictionary
{
    return @{@"Text"  : @"EASTBOUND",
             @"Value" : @"2"};
}

- (NTDirection *)southVO
{
    NTDirection *southVO = [[NTDirection alloc] init];
    [southVO setDirection:NTDirectionSouthbound];
    return southVO;
}

- (NTDirection *)eastVO;
{
    NTDirection *eastVO  = [[NTDirection alloc] init];
    [eastVO setDirection:NTDirectionEastbound];
    return eastVO;
}

- (NTDirection *)westVO
{
    NTDirection *westVO  = [[NTDirection alloc] init];
    [westVO setDirection:NTDirectionWestbound];
    return westVO;
}

- (NTDirection *)northVO
{
    NTDirection *northVO = [[NTDirection alloc] init];
    [northVO setDirection:NTDirectionNorthbound];
    return northVO;
}

@end
