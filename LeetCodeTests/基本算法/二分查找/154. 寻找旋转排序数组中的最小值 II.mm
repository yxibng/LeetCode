//
//  BinarySearch202112262209.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/26.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;

class Solution {
public:
    int findMin(vector<int>& nums) {

        int left = 0;
        int right = (int)nums.size()-1;
        
        while (left < right) {
         
            int mid = left + ((right - left) >> 1);
            if (nums[mid] < nums[right]) {
                //右边递增的，去左边找
                right = mid;
                
            } else if (nums[mid] > nums[right]) {
                //右边是递减的
                left = mid + 1;
            } else {
                right--;
            }
        }
        return nums[left];
    }
};

@interface BinarySearch202112262209 : XCTestCase

@end

@implementation BinarySearch202112262209

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
