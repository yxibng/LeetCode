//
//  Offer202201121908.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/12.
//

#import <XCTest/XCTest.h>

class Solution {
public:
    double myPow(double x, int n) {
        
        if (n == 0) {
            return 1;
        }
        
        if (n == 1) {
            return x;
        }
        
        double val = myPow(x, abs(n/2));
        if (n %2 == 0) {
            if (n > 0) {
                return val *val;
            } else {
                return 1/(val *val);
            }
        } else {
            if (n > 0) {
                return val * val * x;
            } else {
                return 1 / (val * val * x);
            }
        }
    }
};

@interface Offer202201121908 : XCTestCase

@end

@implementation Offer202201121908

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
