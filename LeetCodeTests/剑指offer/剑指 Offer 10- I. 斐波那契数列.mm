//
//  Offer202112310950.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2021/12/31.
//

#import <XCTest/XCTest.h>


class Solution {
public:
    int fib(int n) {
        
        if (n == 0) {
            return 0;
        }
        
        if (n == 1) {
            return 1;
        }
        
        int left = 0;
        int right = 1;
        int ret = 1;
        for (int i = 2; i<= n; i++) {
            ret = (left + right)%1000000007;
            left = right;
            right = ret;
        }
        return ret;
    }
};


@interface Offer202112310950 : XCTestCase

@end

@implementation Offer202112310950

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
