//
//  BinarySearch202112261818.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/26.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;
/*
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。

 进阶：

 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/binary-search/xenp13/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */


class Solution {
public:
    vector<int> searchRange(vector<int>& nums, int target) {
        if (nums.empty()) {
            //数组为空
            return vector<int>{-1, -1};
        }
        
        if (nums[0] > target || nums[nums.size()-1] < target) {
            //不在区间内
            return vector<int>{-1, -1};
        }
        
        vector<int> answer;
        int left = 0;
        int right = (int)nums.size() - 1;
        
        while (left+1 < right) {
            int mid = left + ((right - left) >> 1);
            if (nums[mid] >= target) {
                //向左查找
                right = mid;
            } else  {
                //向右查找
                left = mid + 1;
            }
        }
        //left+1 = right
        int start = -1;
        if (nums[left] == target) {
            //从left 开始
            start = left;
        }
        if (nums[right] == target && start == -1) {
            //从right 开始
            start = right;
        }
    
        if (start == -1) {
            //没找到
            return vector<int>{-1, -1};
        }
        
        
        int end = -1;
        for (int index = start; index < nums.size(); index ++) {
            if (nums[index] != target) {
                break;
            } else {
                end = index;
            }
        }
        return vector<int> {start, end};
    }
    
};



@interface BinarySearch202112261818 : XCTestCase

@end

@implementation BinarySearch202112261818

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
        vector<int> nums {5,7,7,8,8,10};
        Solution su;
        vector<int> ret = su.searchRange(nums, 8);
        vector<int> answer {3, 4};
        XCTAssert(ret == answer);
    }
    
    {
        vector<int> nums {5,7,7,8,8,10};
        Solution su;
        vector<int> ret = su.searchRange(nums, 6);
        vector<int> answer {-1, -1};
        XCTAssert(ret == answer);
    }
    
    {
        vector<int> nums {};
        Solution su;
        vector<int> ret = su.searchRange(nums, 0);
        vector<int> answer {-1, -1};
        XCTAssert(ret == answer);
    }
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
