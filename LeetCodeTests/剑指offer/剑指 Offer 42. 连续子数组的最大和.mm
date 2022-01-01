//
//  Offer202201011411.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/1.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
/*
 输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。
 
 示例1:

 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
  

 提示：

 1 <= arr.length <= 10^5
 -100 <= arr[i] <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */


class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        if (nums.empty()) {
            return 0;
        }
        vector<int> dp(nums.size());
        dp[0] = nums[0];
        int res = dp[0];
        for (int i = 1; i< nums.size(); i++) {
            if (dp[i-1] > 0) {
                dp[i] = dp[i -1] + nums[i];
            } else {
                dp[i] = nums[i];
            }
            res = max(res, dp[i]);
        }
        return res;
    }
};



@interface Offer202201011411 : XCTestCase

@end

@implementation Offer202201011411

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    Solution su;
    vector<int> nums {-2,1,-3,4,-1,2,1,-5,4};
    int res = su.maxSubArray(nums);
    XCTAssert(res ==6);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
