//
//  Easy202202081058.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/8.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
public:
    int missingNumber(vector<int>& nums) {
        int ret = 0;
        for (int i = 0; i< nums.size(); i++) {
            ret = ret ^ nums[i] ^ i;
        }
        ret = ret ^ (int)nums.size();
        return ret;
    }
};


@interface Easy202202081058 : XCTestCase

@end

@implementation Easy202202081058

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
