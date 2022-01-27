//
//  Easy2022001272151.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/27.
//

#import <XCTest/XCTest.h>
#import <vector>

/*
 输入: nums = [1,2,3,4,5,6,7], k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右轮转 1 步: [7,1,2,3,4,5,6]
 向右轮转 2 步: [6,7,1,2,3,4,5]
 向右轮转 3 步: [5,6,7,1,2,3,4]

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2skh7/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

using namespace std;
class Solution {
    void reverse(vector<int>&nums, int start, int end) {
        if (start == end) {
            return;
        }
        
        while (start < end) {
            swap(nums[start++], nums[end--]);
        }
    }
public:
    void rotate(vector<int>& nums, int k) {
        if (nums.empty()) {
            return;
        }
        int len = (int)nums.size();
        
        k = k % len;
        if (k==0) {
            return;
        }
        //整体翻转
        reverse(nums, 0, len-1);
        //翻转前k个
        reverse(nums, 0, k-1);
        //翻转剩余数组
        reverse(nums, k, len-1);
    }
};

@interface Easy2022001272151 : XCTestCase

@end

@implementation Easy2022001272151

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    {
        
        vector<int> nums{1,2,3,4,5,6,7};
        Solution().rotate(nums, 3);
        vector<int> ret {5,6,7,1,2,3,4};
        XCTAssert(nums == ret);
        
        
    }
    
    {
        
        vector<int> nums{-1,-100,3,99};
        Solution().rotate(nums, 2);
        vector<int> ret {3,99,-1,-100};
        XCTAssert(nums == ret);
    }
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
