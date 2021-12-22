//
//  Test20211219.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/19.
//

#import <XCTest/XCTest.h>
#include <iostream>
#include <queue>


using namespace std;

namespace heap {

class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        priority_queue<int> heap;
        for (int i = 0; i< nums.size(); i++) {
            heap.push(nums[i]);
            if (heap.size() > k) {
                heap.pop();
            }
        }
        return heap.top();
    }
};

}

namespace quickselect {

class Solution {
public:
    int findKthLargest(vector<int>& nums, int k) {
        int len = (int)nums.size();
        int target = len - k;
        int left = 0;
        int right = len - 1;
        return quickSelect(nums, left, right, target);
    }
    
    int partition(vector<int>& nums, int left, int right) {
        int pivot = nums[left];
        swap(nums[left], nums[right]);
        int i = left;
        for (int j = i; j < right; j++) {
            if (nums[j] < pivot) {
                swap(nums[i], nums[j]);
                i++;
            }
        }
        swap(nums[i], nums[right]);
        return i;
    }
    
    
    int quickSelect(vector<int>& nums, int left, int right, int targetIndex) {
        if (left == right) {
            return nums[left];
        }
        int index = partition(nums, left, right);
        if (index == targetIndex) {
            return nums[index];
        }
        if (index < targetIndex) {
            return quickSelect(nums, index+1, right, targetIndex);
        } else {
            return quickSelect(nums, left, index-1, targetIndex);
        }
    }
};

}





@interface Test20211219 : XCTestCase

@end

@implementation Test20211219

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    quickselect::Solution su{};
    vector<int> arr {3,2,1,5,6,4};
    int ret = su.findKthLargest(arr, 2);
    XCTAssert(ret == 5);
    
    vector<int> arr1 {3,2,3,1,2,4,5,5,6};
    ret = su.findKthLargest(arr1, 4);
    XCTAssert(ret == 4);
    
    
    
    
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
