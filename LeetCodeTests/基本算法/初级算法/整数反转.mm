//
//  Easy202202041958.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/4.
//

#import <XCTest/XCTest.h>

class Solution {
public:
    int reverse(int x) {
        
        long ret = 0;
        while (x != 0) {
            ret = ret * 10 + x % 10;
            x = x / 10;
        }
        return (int)ret == ret ? (int)ret : 0;
    }
};


@interface Easy202202041958 : XCTestCase

@end

@implementation Easy202202041958

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
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
