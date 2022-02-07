//
//  Easy202202071049.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/7.
//

#import <XCTest/XCTest.h>

class Solution {
public:
    bool isPowerOfThree(int n) {

        if (n == 0) return false;
        if (n == 1) return true;
        long ret = 1;
        while (ret < n) {
            ret = ret * 3;
        }
        return ret == n;
    }
};


@interface Easy202202071049 : XCTestCase

@end

@implementation Easy202202071049

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    bool ret = Solution().isPowerOfThree(19684);
    XCTAssert(ret == false);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
