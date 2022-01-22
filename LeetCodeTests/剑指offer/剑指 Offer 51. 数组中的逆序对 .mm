//
//  Offer202201221958.m
//  LeetCodeTests
//
//  Created by yxb on 2022/1/22.
//

#import <XCTest/XCTest.h>
#include <vector>
using namespace std;

class Solution {
    
    int mergeSort(vector<int> &nums, int start, int end, vector<int>&temp) {
        
        if (start >= end) {
            return 0;
        }
        
        int mid = start + (end - start)/2;
        int left =  mergeSort(nums, start, mid, temp);
        int right = mergeSort(nums, mid+1, end, temp);
        
        int i = start;
        int j = mid + 1;
        int k = start;
        int count = 0;
        while (i <= mid && j <= end) {
            if (nums[i] <= nums[j]) {
                temp[k++] = nums[i++];
            } else {
                temp[k++] = nums[j++];
                count += mid - i + 1;
            }
        }
        
        while (i <= mid) {
            temp[k++] = nums[i++];
        }
        
        while (j <= end) {
            temp[k++] = nums[j++];
        }
        copy(temp.begin() + start, temp.begin() + end + 1, nums.begin() + start);
        return left + right + count;
    }
public:
    int reversePairs(vector<int>& nums) {
        vector<int> temp(nums.size());
        return mergeSort(nums, 0, nums.size()-1, temp);
    }
};


@interface Offer202201221958 : XCTestCase

@end

@implementation Offer202201221958

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
        vector<int>nums {7,5,6,4};
        int ret = Solution().reversePairs(nums);
        XCTAssert(ret == 5);
    }
    
    {
        vector<int>nums {};
        int ret = Solution().reversePairs(nums);
        XCTAssert(ret == 0);
    }

    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
