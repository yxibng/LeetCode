//
//  Offer202201162038.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/16.
//

#import <XCTest/XCTest.h>
#include <iostream>

class Solution {
public:
    int cuttingRope(int n) {
        int dp[n+1];
        memset(dp, 0, (n+1) * sizeof(int));
        
        dp[2] = 1;
        for (int i = 3; i<=n; i++) {
            for (int j = 2 ; j < i; j++) {
                dp[i] = std::max(dp[i], std::max(j * (i-j), j * dp[i-j]));
            }
        }
        return dp[n];
    }
};


@interface Offer202201162038 : XCTestCase

@end

@implementation Offer202201162038

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    int ret = Solution().cuttingRope(10);
    XCTAssert(ret == 36);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
