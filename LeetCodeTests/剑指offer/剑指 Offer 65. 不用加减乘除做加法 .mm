//
//  Offer202201131428.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/13.
//

#import <XCTest/XCTest.h>

class Solution {
public:
    int add(int a, int b) {

        while (b) {
            int temp = a ^ b;
            int carry = (a & b);
            a = temp;
            b = (unsigned)carry << 1;
        }
        return a;
    }
};


@interface Offer202201131428 : XCTestCase

@end

@implementation Offer202201131428

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
