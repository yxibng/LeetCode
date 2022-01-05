//
//  Offer202201051351.m
//  LeetCodeTests
//
//  Created by xiaobing yao on 2022/1/5.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;
/*
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

  

 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[2,7] 或者 [7,2]
 示例 2：

 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
  

 限制：

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {

        vector<int> ans;
        int left = 0;
        int right = (int)nums.size()-1;
        while (left < right) {
            if (nums[left] + nums[right] > target) {
                right--;
            } else if (nums[left] + nums[right] < target) {
                left++;
            } else {
                ans.push_back(nums[left]);
                ans.push_back(nums[right]);
                break;;
            }
        }
        return ans;
    }
};





@interface Offer202201051351 : XCTestCase

@end

@implementation Offer202201051351

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
