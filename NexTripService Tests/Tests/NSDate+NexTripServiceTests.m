//
//  NSDate+NexTripServiceTests.m
//  NexTripService
//
//  Created by Sean Hickey on 11/24/13.
//
//

#import <XCTest/XCTest.h>
#import "NSDate+NexTripService.h"

@interface NSDate_NexTripServiceTests : XCTestCase

@end

@implementation NSDate_NexTripServiceTests

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

- (void)testJSONDateParsing
{
    NSString *validJSONDate = @"/Date(1385308020000-0600)/";
    NSDate *date = [NSDate dateWithJSONDate:validJSONDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CST"]];
    
    NSString *dateString = [formatter stringFromDate:date];
    XCTAssert([dateString isEqualToString:@"09:47"], @"Time strings are not equal. Expected: %@, Got: %@", @"09:47", dateString);
}

@end
