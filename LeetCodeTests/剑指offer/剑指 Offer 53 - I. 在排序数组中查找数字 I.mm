//
//  Offer202112272235.m
//  LeetCodeTests
//
//  Created by yxibng on 2021/12/27.
//

#import <XCTest/XCTest.h>
#include<vector>
using namespace std;

class Solution {
public:
    int search(vector<int>& nums, int target) {

        if (nums.empty()) {
            return 0;
        }
        
        int left = 0;
        int right = (int)nums.size() -1;
        while (left < right) {
            int mid = left + ((right - left)>>1);
            if (nums[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        int count = 0;
        if (nums[left] == target) {
            for (int i = left; i < (int)nums.size() -1; i++) {
                if (nums[i] == target) {
                    count++;
                }
            }
        }
        return count;
    }
};
@interface Offer202112272235 : XCTestCase

@end

@implementation Offer202112272235

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
