//
//  LeetCode202202111004.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/11.
//

#import <XCTest/XCTest.h>
#include <vector>

using namespace std;
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        if (nums.empty()) {
            return 0;
        }
        vector<int>dp(nums.size(), 1);
        int maxLength = 1;
        for (int i = 0; i< nums.size(); i++) {
            dp[i] = 1;
            for (int j = 0; j < i; j++) {
                if (nums[j] < nums[i]) {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }
            maxLength = max(maxLength, dp[i]);
        }
        return maxLength;
    }
};



@interface LeetCode202202111004 : XCTestCase

@end

@implementation LeetCode202202111004

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    {
        vector<int> nums{10,9,2,5,3,7,101,18};
        int ret = Solution().lengthOfLIS(nums);
        XCTAssert(ret == 4);
    }
    
    {
        vector<int> nums{0,1,0,3,2,3};
        int ret = Solution().lengthOfLIS(nums);
        XCTAssert(ret == 4);
    }

    {
        vector<int> nums{7,7,7,7,7,7,7};
        int ret = Solution().lengthOfLIS(nums);
        XCTAssert(ret == 1);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
