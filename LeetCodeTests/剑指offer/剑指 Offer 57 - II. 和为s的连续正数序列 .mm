//
//  Offer202201162231.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/16.
//

#import <XCTest/XCTest.h>
#include <vector>

/*
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

  

 示例 1：

 输入：target = 9
 输出：[[2,3,4],[4,5]]
 示例 2：

 输入：target = 15
 输出：[[1,2,3,4,5],[4,5,6],[7,8]]
  

 限制：

 1 <= target <= 10^5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


using namespace std;
class Solution {
public:
    vector<vector<int>> findContinuousSequence(int target) {
        int left = 1;
        int right = 1;
        
        vector<vector<int>> ans;
        while (left <= target / 2) {
            
            int sum = (left + right) * (right - left + 1) / 2;
            
            if (sum < target) {
                right++;
            } else if (sum> target) {
                left++;
            } else {
                vector<int> nums;
                for (int i = left; i<=right; i++) {
                    nums.push_back(i);
                }
                ans.push_back(nums);
                //从下一个区间开始寻找
                left++;
            }
        }
        return ans;
    }
};


@interface Offer202201162231 : XCTestCase

@end

@implementation Offer202201162231

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    auto ret = Solution().findContinuousSequence(9);
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
