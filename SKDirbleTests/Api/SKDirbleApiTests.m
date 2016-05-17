//
//  SKDirbleApiTests.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/16.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SKDirbleApi.h"

#warning should fill in token before perform test
static NSString * const kDirbleToken = @"";

static const NSInteger kPrimaryCategoryToTest = 71;
static const NSInteger kChildCategoryToTest = 76;

static const NSInteger kContinentToTest = 2;
static NSString * const kCountryToTest = @"TW";

static NSString * const kKeywordToTest = @"Japan";

@interface SKDirbleApiTests : XCTestCase

@end

@implementation SKDirbleApiTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_shouldGetStationList {
    NSError *error = nil;
    
    NSArray *stations = [SKDirbleApi listStations:kDirbleToken pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"stations: %@", stations);
    
    XCTAssertEqual([stations count], 30);
    XCTAssertNil(error);
}

- (void)test_shouldGetRecentAddedStationList {
    NSError *error = nil;
    
    NSArray *recentAddedStations = [SKDirbleApi listRecentAddedStations:kDirbleToken pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"recentAddedStations: %@", recentAddedStations);
    
    XCTAssertEqual([recentAddedStations count], 30);
    XCTAssertNil(error);
}

- (void)test_shouldGetPopularStationList {
    NSError *error = nil;
    
    NSArray *popularStations = [SKDirbleApi listPopularStations:kDirbleToken pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"popularStations: %@", popularStations);
    
    XCTAssertEqual([popularStations count], 30);
    XCTAssertNil(error);
}

- (void)test_shouldGetCategoryList {
    NSError *error = nil;
    
    NSArray *categories = [SKDirbleApi listCategories:kDirbleToken error:&error];
    
    NSLog(@"categories: %@", categories);
    
    XCTAssertNil(error);
}

- (void)test_shouldGetPrimaryCategoryList {
    NSError *error = nil;
    
    NSArray *primaryCategories = [SKDirbleApi listPrimaryCategories:kDirbleToken error:&error];
    
    NSLog(@"primaryCategories: %@", primaryCategories);
    
    XCTAssertNil(error);
}

- (void)test_shouldGetChildCategoryList {
    NSError *error = nil;
    
    NSArray *childCategories = [SKDirbleApi listChildCategories:kDirbleToken primaryCategory:kPrimaryCategoryToTest pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"childCategories: %@", childCategories);
    
    XCTAssertNil(error);
}

- (void)test_shouldGetStationsInCategory {
    NSError *error = nil;
    
    NSArray *stations = [SKDirbleApi listStations:kDirbleToken category:kChildCategoryToTest pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"stations: %@", stations);
    
    XCTAssertNil(error);
}

- (void)test_shouldSearchStations {
    NSError *error = nil;
    
    NSArray *stations = [SKDirbleApi listStations:kDirbleToken keyword:kKeywordToTest pageIndex:0 error:&error];
    
    NSLog(@"stations: %@", stations);
    
    XCTAssertEqual([stations count], 10);
    XCTAssertNil(error);
}

- (void)test_shouldListCountries {
    NSError *error = nil;
    
    NSArray *countries = [SKDirbleApi listCountries:kDirbleToken error:&error];
    
    NSLog(@"countries: %@", countries);
    
    XCTAssertNil(error);
}

- (void)test_shouldListContinents {
    NSError *error = nil;
    
    NSArray *continents = [SKDirbleApi listContinents:kDirbleToken error:&error];
    
    NSLog(@"continents: %@", continents);
    
    XCTAssertNil(error);
}

- (void)test_shouldListCountriesInContinent {
    NSError *error = nil;
    
    NSArray *countries = [SKDirbleApi listCountries:kDirbleToken continent:kContinentToTest pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"countries: %@", countries);
    
    XCTAssertNil(error);
}

- (void)test_shouldListStationsInCountry {
    NSError *error = nil;
    
    NSArray *stations = [SKDirbleApi listStations:kDirbleToken country:kCountryToTest pageIndex:0 pageSize:30 error:&error];
    
    NSLog(@"stations: %@", stations);
    
    XCTAssertNil(error);
}

@end
