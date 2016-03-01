//
//  block_protocol__Tests.m
//  block和protocol传值Tests
//
//  Created by 0X10 on 16/3/1.
//  Copyright © 2016年 crazy. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface block_protocol__Tests : XCTestCase

@end

@implementation block_protocol__Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
