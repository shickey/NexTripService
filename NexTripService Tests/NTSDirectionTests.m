//
//  NTSDirectionTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "NTSDirection.h"

@interface NTSDirectionTests : XCTestCase

- (NSDictionary *)validDirectionDictionary;
- (NTSDirection *)southVO;
- (NTSDirection *)eastVO;
- (NTSDirection *)westVO;
- (NTSDirection *)northVO;

@end

@implementation NTSDirectionTests

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
    NTSDirection *vo = [NTSDirection valueObjectFromJSON:[self validDirectionDictionary]];
    XCTAssert(vo.direction == NTDirectionEastbound);
}

- (void)testIsEqualMethod
{
    NTSDirection *vo1 = [NTSDirection valueObjectFromJSON:[self validDirectionDictionary]];
    NTSDirection *vo2 = [[NTSDirection alloc] init];
    vo2.direction = NTSDirectionEastbound;
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

- (NTSDirection *)southVO
{
    NTSDirection *southVO = [[NTSDirection alloc] init];
    [southVO setDirection:NTSDirectionSouthbound];
    return southVO;
}

- (NTSDirection *)eastVO;
{
    NTSDirection *eastVO  = [[NTSDirection alloc] init];
    [eastVO setDirection:NTSDirectionEastbound];
    return eastVO;
}

- (NTSDirection *)westVO
{
    NTSDirection *westVO  = [[NTSDirection alloc] init];
    [westVO setDirection:NTSDirectionWestbound];
    return westVO;
}

- (NTSDirection *)northVO
{
    NTSDirection *northVO = [[NTSDirection alloc] init];
    [northVO setDirection:NTSDirectionNorthbound];
    return northVO;
}

@end
