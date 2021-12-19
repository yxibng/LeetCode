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
