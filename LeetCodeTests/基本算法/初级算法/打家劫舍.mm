//
//  Easy202202062121.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/6.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
class Solution {
public:
    int rob(vector<int>& nums) {
        if (nums.empty()) {
            return 0;
        }
        
        int length = (int)nums.size();
        if (length == 1) {
            return nums[0];
        }
        
        if (length == 2) {
            return max(nums[0], nums[1]);
        }
        
        int dp[nums.size()];
        dp[0] = nums[0];
        dp[1] = max(nums[0], nums[1]);
        for (int i = 2; i < length; i++) {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i]);
        }
        return dp[length-1];
    }
};
@interface Easy202202062121 : XCTestCase

@end

@implementation Easy202202062121

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
