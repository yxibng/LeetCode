//
//  LeetCode202202212345.m
//  LeetCodeTests
//
//  Created by yxb on 2022/2/21.
//

#import <XCTest/XCTest.h>

#include <vector>
using namespace std;

namespace LC202202212345 {
    class Solution {
        
        int leftIndex(vector<int>&nums, int mid) {
            
            int left = 0, right = mid;
            int target = nums[mid];
            
            while (left <= right) {
                mid = left + (right- left) / 2;
                if (nums[mid] == target) {
                    right = mid-1;
                } else {
                    left = mid + 1;
                }
            }
            return right+1;
        }
        
        int rightIndex(vector<int>&nums, int mid) {
            int left = mid, right = nums.size() - 1;
            int target = nums[mid];
            while (left <= right) {
                mid = left + (right- left) / 2;
                if (nums[mid] == target) {
                    left = mid+1;
                } else {
                    right = mid -1;
                }
            }
            return left-1;
        }
        
    public:
        vector<int> searchRange(vector<int>& nums, int target) {
            if (nums.empty()) return {-1, -1};
            
            int left = 0, right = nums.size()-1;
            int index = -1;
            while (left <= right) {
                int mid = left + (right - left) / 2;
                if (nums[mid] == target) {
                    index = mid;
                    break;
                } else if (nums[mid] > target) {
                    right = mid -1;
                } else {
                    left = mid + 1;
                }
            }
            if (index == -1) return {-1, -1};
            
            left = leftIndex(nums, index);
            right = rightIndex(nums, index);
            return {left, right};
        }
    };
    
};


@interface LeetCode202202212345 : XCTestCase

@end

@implementation LeetCode202202212345

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
        vector<int>nums {5,7,7,8,8,10};
        auto ret = LC202202212345::Solution().searchRange(nums, 8);
        vector<int> ans {3,4};
        XCTAssert(ret == ans);
        
    }
    
    {
        vector<int>nums {5,7,7,8,8,10};
        auto ret = LC202202212345::Solution().searchRange(nums, 6);
        vector<int> ans {-1,-1};
        XCTAssert(ret == ans);
    }

    {
        vector<int>nums {};
        auto ret = LC202202212345::Solution().searchRange(nums, 0);
        vector<int> ans {-1,-1};
        XCTAssert(ret == ans);
    }

    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
