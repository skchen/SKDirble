//
//  SKDirbleBrowserTests.m
//  SKDirble
//
//  Created by Shin-Kai Chen on 2016/5/17.
//  Copyright © 2016年 SK. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SKDirbleBrowser.h"

#warning should fill in token before perform test
static NSString * const kDirbleToken = @"";

@interface SKDirbleBrowserTests : XCTestCase

@property(nonatomic, strong, nonnull, readonly) SKDirbleBrowser *browser;

@end

@implementation SKDirbleBrowserTests {
    XCTestExpectation *mExpectation;
}

- (void)setUp {
    [super setUp];
    _browser = [[SKDirbleBrowser alloc] initWithToken:kDirbleToken];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_shouldListMostPopularStations {
    mExpectation = [self expectationWithDescription:@"test_shouldListMostPopularStations #1"];
    
    [_browser listMostPopularStations:NO extend:YES success:^(NSArray * _Nonnull list, BOOL finished) {
        NSLog(@"mostPopularStations #1: %@", list);
        [mExpectation fulfill];
    } failure:^(NSError * _Nullable error) {
        XCTFail(@"%@", error);
    }];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        if(error) {
            XCTFail(@"%@", error);
        } else {
            NSLog(@"test_shouldListMostPopularStations #1 done");
        }
    }];
    
    mExpectation = [self expectationWithDescription:@"test_shouldListMostPopularStations #2"];
    
    [_browser listMostPopularStations:NO extend:YES success:^(NSArray * _Nonnull list, BOOL finished) {
        NSLog(@"mostPopularStations #2: %@", list);
        [mExpectation fulfill];
    } failure:^(NSError * _Nullable error) {
        XCTFail(@"%@", error);
    }];
    
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        if(error) {
            XCTFail(@"%@", error);
        } else {
            NSLog(@"test_shouldListMostPopularStations #2 done");
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
